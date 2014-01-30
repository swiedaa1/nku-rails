class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title1
      t.string :nickname
      t.text :text

      t.timestamps
    end
  end
end
