class AddColumnsToTransitProvider < ActiveRecord::Migration
  def change
    add_column :transit_providers, :first_name, :string
    add_column :transit_providers, :last_name, :string
    add_column :transit_providers, :full_name, :string
    add_column :transit_providers, :company_name, :string
    add_column :transit_providers, :address, :string
    add_column :transit_providers, :city, :string
    add_column :transit_providers, :state, :string
    add_column :transit_providers, :zip, :string
    add_column :transit_providers, :phone_number, :string
    add_column :transit_providers, :transit_type, :string
  end
end
