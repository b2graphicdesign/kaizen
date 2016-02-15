class AddIndicesToModels < ActiveRecord::Migration
  def change
    add_index :patients, [:email, :username], unique: true
    add_index :providers, [:email, :username], unique: true
    add_index :transportations, [:email, :username], unique: true
    add_index :drivers, [:email, :username], unique: true
  end
end
