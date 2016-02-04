class RemoveColumnsFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :full_name, :string
    remove_column :patients, :address, :string
    remove_column :patients, :email_address, :string
    remove_column :patients, :age, :integer
    remove_column :patients, :gender, :string
    remove_column :patients, :notes, :string
    remove_column :patients, :insurance_name, :string
    remove_column :patients, :insurance_type, :string
    remove_column :patients, :primary_physician_full_name, :string
    remove_column :patients, :primary_physician_phone, :string
    remove_column :patients, :preferred_contact, :string
    remove_column :patients, :emergency_contact_full_name, :string
    remove_column :patients, :emergency_contact_address, :string
    remove_column :patients, :emergency_contact_phone, :string
    remove_column :patients, :emergency_contact_email, :string
  end
end
