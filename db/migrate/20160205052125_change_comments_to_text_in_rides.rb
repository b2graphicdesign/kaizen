class ChangeCommentsToTextInRides < ActiveRecord::Migration
  def change
    change_column :rides, :comments, :text
  end
end
