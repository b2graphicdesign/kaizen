class CreatePatientTransitProviders < ActiveRecord::Migration
  def change
    create_table :patient_transit_providers do |t|
      t.integer :patient_id
      t.integer :transit_provider_id

      t.timestamps null: false
    end
  end
end
