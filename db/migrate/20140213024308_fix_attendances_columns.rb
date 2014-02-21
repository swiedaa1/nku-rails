class FixAttendancesColumns < ActiveRecord::Migration
  def change
    remove_column :attendances, :seat
    remove_column :attendances, :user_id
    add_column :attendances, :seat, :integer
    add_column :attendances, :user_id, :integer
  end
end
