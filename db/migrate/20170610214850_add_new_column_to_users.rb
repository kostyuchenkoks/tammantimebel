class AddNewColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :phone, :string
    add_column :users, :city, :string
    add_column :users, :address, :string
  end
end
