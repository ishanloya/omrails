class ChangeWardNumberTypeInWards < ActiveRecord::Migration[5.0]
  def change
  	change_column :wards, :ward_number, :string
  	change_column :wards, :ward_officer_number, :string
		change_column :wards, :corporator_number, :string
 		change_column :wards, :inspector_number, :string 
		change_column :wards, :jawan_number, :string      
  end
end
