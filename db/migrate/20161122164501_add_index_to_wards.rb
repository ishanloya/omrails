class AddIndexToWards < ActiveRecord::Migration[5.0]
  def change
    add_index :wards, :ward_number, unique: true
  end
end
