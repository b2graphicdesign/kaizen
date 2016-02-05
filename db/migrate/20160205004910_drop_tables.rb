class DropTables < ActiveRecord::Migration
  def change
    drop_table :patient_health_providers
    drop_table :patient_transit_providers
    drop_table :transit_providers
  end
end
