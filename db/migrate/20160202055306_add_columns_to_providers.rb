class AddColumnsToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :first_name, :string
    add_column :providers, :last_name, :string
    add_column :providers, :full_name, :string
    add_column :providers, :company_name, :string
    add_column :providers, :address, :string
    add_column :providers, :city, :string
    add_column :providers, :state, :string
    add_column :providers, :zip, :string
    add_column :providers, :phone_number, :string
    add_column :providers, :provider_type, :string
  end
end
