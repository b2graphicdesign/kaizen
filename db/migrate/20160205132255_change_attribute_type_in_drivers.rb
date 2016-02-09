class ChangeAttributeTypeInDrivers < ActiveRecord::Migration
  def change
    change_column :drivers, :email, :string
  end
end
