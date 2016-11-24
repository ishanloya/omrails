class Ward < ApplicationRecord

	validates :ward_number, presence: true, uniqueness: true
	validates :zone, :ward_name, :ward_officer, :corporator, :inspector, :jawan, 
		presence: true

	def to_param
	  ward_number
	end

	def self.import(file)
		spreadsheet = Roo::Spreadsheet.open(file.path)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			ward = find_by(ward_number: row["ward_number"]) || new
			ward.attributes = row.to_hash
			ward.save!
		end
	end
end
