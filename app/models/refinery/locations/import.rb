module Refinery
  module Locations
    class Import < Refinery::Core::BaseModel
		  self.table_name = 'refinery_imports'

    	belongs_to :attached_file, :class_name => '::Refinery::Resource'
    	
      attr_accessible :filename, :status, :attached_file_id

      acts_as_indexed :fields => [:filename, :status]

      validates :filename, :presence => true

      class << self
      	def statii
      		['new','empty','uploading','processing','processed','error']
      	end
      end
    end
  end
end
