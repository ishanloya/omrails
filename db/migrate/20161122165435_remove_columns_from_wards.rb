class RemoveColumnsFromWards < ActiveRecord::Migration[5.0]
  def change
  	remove_column :wards, :total_labour_female
  	remove_column :wards, :total_labour_male
  end
end
