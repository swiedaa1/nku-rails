class AddUserid < ActiveRecord::Migration
  def change
    add_column :attendances, :user_id, :string
  end
end
