class AddNewColumnsToRides < ActiveRecord::Migration
  def change
    add_column :rides, :driver_id, :integer
    add_column :rides, :transport_id, :integer
    add_column :rides, :ride_type, :string
    add_column :rides, :appointment_time, :datetime
    add_column :rides, :expected_start_time, :datetime
    add_column :rides, :actual_start_time, :datetime
    add_column :rides, :expected_end_time, :datetime
    add_column :rides, :actual_end_time, :datetime
    add_column :rides, :expected_mileage, :decimal, precision: 10, scale: 2
    add_column :rides, :actual_mileage, :decimal, precision: 10, scale: 2
    add_column :rides, :ride_status, :string
    add_column :rides, :feedback_rating, :integer
    add_column :rides, :feedback_comments, :text
  end
end
