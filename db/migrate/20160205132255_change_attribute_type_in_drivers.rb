class ChangeAttributeTypeInDrivers < ActiveRecord::Migration
  def change
    change_column :drivers, :email, :string, :limit => 25
  end
end
