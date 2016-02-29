class AddEmailResetToModels < ActiveRecord::Migration
  def change
    add_column :drivers, :send_password_email, :boolean
    add_column :patients, :send_password_email, :boolean
    add_column :providers, :send_password_email, :boolean
    add_column :transportations, :send_password_email, :boolean
  end
end
