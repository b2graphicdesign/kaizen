class ChangeInetDataTypes < ActiveRecord::Migration
  def change
    change_column :admins, :current_sign_in_ip, :string
    change_column :admins, :last_sign_in_ip, :string
    change_column :drivers, :current_sign_in_ip, :string
    change_column :drivers, :last_sign_in_ip, :string
    change_column :patients, :current_sign_in_ip, :string
    change_column :patients, :last_sign_in_ip, :string
    change_column :providers, :current_sign_in_ip, :string
    change_column :providers, :last_sign_in_ip, :string
    change_column :transportations, :current_sign_in_ip, :string
    change_column :transportations, :last_sign_in_ip, :string
  end
end
