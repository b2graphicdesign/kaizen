class ChangeAttributesInProviders < ActiveRecord::Migration
  def change
    change_column :providers, :city, :string, :limit => 25
    change_column :providers, :state, :string, :limit => 25
    change_column :providers, :zip, :string, :limit => 15
    change_column :providers, :email, :string, :limit => 15
  end
end
