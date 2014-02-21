class AttenNickname < ActiveRecord::Migration
  def change
    add_column :attendances, :nickname, :string
  end
end
