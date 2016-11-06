class RenameHandleToUsername < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :handle, :username
  end
end
