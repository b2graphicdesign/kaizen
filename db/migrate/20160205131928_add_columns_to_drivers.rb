class AddColumnsToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :transport_id, :integer
    add_column :drivers, :username, :string, :limit => 15
    add_column :drivers, :first_name, :string, :limit => 25
    add_column :drivers, :last_name, :string, :limit => 25
    add_column :drivers, :address_1, :string, :limit => 25
    add_column :drivers, :address_2, :string, :limit => 25
    add_column :drivers, :city, :string, :limit => 25
    add_column :drivers, :state, :string, :limit => 25
    add_column :drivers, :zip, :string, :limit => 15
    add_column :drivers, :phone, :string, :limit => 15
    add_column :drivers, :insurance_company, :string, :limit => 50
    add_column :drivers, :insurance_account, :string, :limit => 50
    add_column :drivers, :drivers_license_state, :string, :limit => 25
    add_column :drivers, :drivers_license_no, :string, :limit => 25
    add_column :drivers, :drivers_license_expiry, :datetime
    add_column :drivers, :vehicle_year, :integer
    add_column :drivers, :vehicle_make, :string, :limit => 25
    add_column :drivers, :vehicle_model, :string, :limit => 25
    add_column :drivers, :vehicle_type, :string, :limit => 25
    add_column :drivers, :vehicle_color, :string, :limit => 25
    add_column :drivers, :vehicle_license_plate, :string, :limit => 10
    add_column :drivers, :vehicle_registration_expiry, :datetime
  end
end
