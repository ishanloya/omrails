class ChangeWardNumberTypeToIntInWards < ActiveRecord::Migration[5.0]
  def change
  	change_column :wards, :ward_number, :integer
  end
end
