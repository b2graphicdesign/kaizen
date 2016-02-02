class AddColumnsToRides < ActiveRecord::Migration
  def change
    add_column :rides, :transit_provider_id, :integer
    add_column :rides, :patient_id, :integer
    add_column :rides, :provider_id, :integer
    add_column :rides, :pickup_time, :datetime
    add_column :rides, :comments, :string
  end
end
