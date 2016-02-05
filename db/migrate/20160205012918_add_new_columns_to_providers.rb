class AddNewColumnsToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :username, :string, :limit => 15
    add_column :providers, :facility_name, :string, :limit => 50
    add_column :providers, :address_1, :string, :limit => 25
    add_column :providers, :address_2, :string, :limit => 25
    add_column :providers, :county, :string, :limit => 25
    add_column :providers, :address_notes, :text
    add_column :providers, :phone, :string, :limit => 15
    add_column :providers, :fax, :string, :limit => 15
  end
end
