class AddColumnsToTransportations < ActiveRecord::Migration
  def change
    add_column :transportations, :username, :string, :limit => 25
    add_column :transportations, :company_name, :string, :limit => 50
    add_column :transportations, :address_1, :string, :limit => 25
    add_column :transportations, :address_2, :string, :limit => 25
    add_column :transportations, :city, :string, :limit => 25
    add_column :transportations, :state, :string, :limit => 25
    add_column :transportations, :zip, :string, :limit => 15
    add_column :transportations, :phone, :string, :limit => 15
    add_column :transportations, :fax, :string, :limit => 15
  end
end
