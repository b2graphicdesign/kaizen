class RemoveColumnsFromRides < ActiveRecord::Migration
  def change
    remove_column :rides, :transit_provider_id, :integer
    remove_column :rides, :pickup_time, :datetime
  end
end
