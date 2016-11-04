class AddHandleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :handle, :string
    add_index :users, :handle, unique: true
  end
end
