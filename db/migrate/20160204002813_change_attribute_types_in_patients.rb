class ChangeAttributeTypesInPatients < ActiveRecord::Migration
  def change
    change_column :patients, :first_name, :string, :limit => 25
    change_column :patients, :last_name, :string, :limit => 25
    change_column :patients, :city, :string, :limit => 25
    change_column :patients, :state, :string, :limit => 25
    change_column :patients, :zip, :string, :limit => 15
    change_column :patients, :email, :string, :limit => 25
  end
end