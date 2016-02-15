class AddIndicesToModelsPartTwo < ActiveRecord::Migration
  def change
    add_column :admins, :username, :string, limit: 15
    add_index :admins, [:username, :email], unique: true
    add_index :patients, :username, unique: true
    add_index :providers, :username, unique: true
    add_index :transportations, :username, unique: true
    add_index :drivers, :username, unique: true
  end
end
