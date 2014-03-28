class CreateAssignments < ActiveRecord::Migration
  def change
    drop_table :assignments
    create_table :assignments do |t|

      t.timestamps
    end
  end
end
