class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :passcon, :string
  end
end
