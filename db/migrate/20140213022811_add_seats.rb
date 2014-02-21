class AddSeats < ActiveRecord::Migration
  def change
    add_column :attendances, :seat, :string
    add_column :attendances, :attended_on, :string
  end
end
