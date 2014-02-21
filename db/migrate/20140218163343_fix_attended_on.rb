class FixAttendedOn < ActiveRecord::Migration
  def change
    remove_column :attendances, :attended_on
    add_column :attendances, :attended_on, :date
  end
end
