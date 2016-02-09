class RemoveLimitsOnEmails < ActiveRecord::Migration
  def change
    change_column :patients, :email, :string
    change_column :admins, :email, :string
    change_column :providers, :email, :string
    change_column :drivers, :email, :string
    change_column :transportations, :email, :string
  end
end
