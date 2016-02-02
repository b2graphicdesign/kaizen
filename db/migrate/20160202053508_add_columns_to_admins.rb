class AddColumnsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :full_name, :string
    add_column :admins, :company_name, :string
  end
end
