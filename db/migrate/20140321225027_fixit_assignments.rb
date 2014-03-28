class FixitAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :total, :integer
    add_column :assignments, :score, :integer
    add_column :assignments, :name, :string
  end
end
