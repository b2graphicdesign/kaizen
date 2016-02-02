class AddColumnsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :first_name, :string
    add_column :patients, :last_name, :string
    add_column :patients, :full_name, :string
    add_column :patients, :address, :string
    add_column :patients, :city, :string
    add_column :patients, :state, :string
    add_column :patients, :zip, :string
    add_column :patients, :phone_number, :string
    add_column :patients, :email_address, :string
    add_column :patients, :age, :integer
    add_column :patients, :gender, :string
    add_column :patients, :notes, :string
    add_column :patients, :insurance_name, :string
    add_column :patients, :insurance_type, :string
    add_column :patients, :primary_physician_full_name, :string
    add_column :patients, :primary_physician_phone, :string
    add_column :patients, :preferred_contact, :string
    add_column :patients, :emergency_contact_full_name, :string
    add_column :patients, :emergency_contact_address, :string
    add_column :patients, :emergency_contact_phone, :string
    add_column :patients, :emergency_contact_email, :string
  end
end
