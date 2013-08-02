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
      def has_an_address(row = nil)
        return false if row.blank? or !row.is_a?(Spreadsheet::Excel::Row)
        address_columns = (1..4)
        row[address_columns].all? {|text| text && !text.to_s.strip.empty? }
      end

      # process the import of the actual filename

      def process_filename
        spreadsheet = Spreadsheet.open "#{Rails.root}/public/system/refinery/resources/#{self.attached_file.file_uid}"        
        first_worksheet = spreadsheet.worksheet 0
        first_worksheet.each(5) do |row|
          next if row.compact.reject(&:blank?).empty? || row[0] == 'ECOMMERCE'
          location = Location.new do |l|
            l.name = row[0]
            l.address = row[1]
            l.city = row[2]
            l.state_or_province = row[3]
            l.zip = row[4]
            l.country = row[5]
            l.phone = row[6]
            l.website = row[7]
            l.online = !has_an_address(row)
            l.women = (row[8] ? true : false)
            l.handbags = (row[9] ? true : false)
            l.shoes = (row[10] ? true : false)
            l.eyewear = (row[11] ? true : false)
            l.jewelry = (row[12] ? true : false)
            l.textile = (row[13] ? true : false)            
          end
          location.save!
        end
      rescue Exception => e 
        Rails.logger.error("Error processing import #{self.id}: #{e.message}")
      end
    end
  end
end
