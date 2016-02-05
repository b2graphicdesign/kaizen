class DeleteColumnsFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :first_name, :string
    remove_column :providers, :last_name, :string
    remove_column :providers, :full_name, :string
    remove_column :providers, :company_name, :string
    remove_column :providers, :address, :string
    remove_column :providers, :phone_number, :string
    remove_column :providers, :provider_type, :string
  end
end
