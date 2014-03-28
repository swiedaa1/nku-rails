class Assignments < ActiveRecord::Base
  belongs_to :user
  
  validates :score, numericality: { only_integer: true,
    greater_than_or_equal_to: 0 }
  validates :total, numericality: { only_integer: true,
    greater_than_or_equal_to: 0 }
  
  require 'csv'
  
  def self.import(file)    
    @original_filename = file.original_filename
    @num_rows = 0
    
    CSV.foreach(file.path, headers: true) do |row|
      @user = User.find_by_email(row['Email'].to_s) || User.new
      
      #check for old submissions
      old = Assignments.where("user_id = ? AND name = ?", @user.id, row['Assignment Name'].to_s).first
      
      if old != nil
        old.total = row['Total'].to_i
        old.score = row['Score'].to_i
        old.save
      else
        assignment = Assignments.new
        assignment.user_id = @user.id
        assignment.name = row['Assignment Name'].to_s
        assignment.total = row['Total'].to_i
        assignment.score = row['Score'].to_i
        assignment.save!
        @num_rows = @num_rows + 1
      end      
    end
    return @num_rows
  end
end
