module Refinery
	module Locations
		module Admin
			class ImportsController < ::Refinery::AdminController
			  crudify :'refinery/locations/import'

				def create
				  # if the position field exists, set this object as last object, given the conditions of this class.
				  if Refinery::Locations::Import.column_names.include?("position") && params[:import][:position].nil?
				    params[:import].merge!({
				      :position => ((Refinery::Locations::Import.maximum(:position, :conditions => "")||-1) + 1)
				    })
				  end

				  if (@import = Refinery::Locations::Import.create(params[:import])).valid?
				    flash.notice = t(
				      'refinery.crudify.created',
				      :what => "'#{@import.title}'"
				    )

				    # If the import has a file, it's time to add locations
				    if @import.attached_file
				    	@import.process_filename
				    end

				    unless from_dialog?
				      unless params[:continue_editing] =~ /true|on|1/
				        redirect_back_or_default(refinery.locations_admin_imports_path)
				      else
				        unless request.xhr?
				          redirect_to :back
				        else
				          render :partial => '/refinery/message'
				        end
				      end
				    else
				      self.index
				      @dialog_successful = true
				      render :index
				    end
				  else
				    unless request.xhr?
				      render :action => 'new'
				    else
				      render :partial => '/refinery/admin/error_messages', :locals => {
				               :object => @import,
				               :include_object_name => true
				             }
				    end
				  end
				end
				def update
					no_import_before = true unless @import.attached_file
				  if @import.update_attributes(params[:import])
				    flash.notice = t(
				      'refinery.crudify.updated',
				      :what => "'#{@import.title}'"
				    )


				    if no_import_before && @import.attached_file
				    	@import.process_filename
				    end

				    unless from_dialog?
				      unless params[:continue_editing] =~ /true|on|1/
				        redirect_back_or_default(refinery.locations_admin_imports_path)
				      else
				        unless request.xhr?
				          redirect_to :back
				        else
				          render :partial => '/refinery/message'
				        end
				      end
				    else
				      self.index
				      @dialog_successful = true
				      render :index
				    end
				  else
				    unless request.xhr?
				      render :action => 'edit'
				    else
				      render :partial => '/refinery/admin/error_messages', :locals => {
				               :object => @import,
				               :include_object_name => true
				             }
				    end
				  end
				end

		  end
		end
	end		
end


