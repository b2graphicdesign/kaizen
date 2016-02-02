class CreatePatientHealthProviders < ActiveRecord::Migration
  def change
    create_table :patient_health_providers do |t|
      t.integer :patient_id
      t.integer :provider_id

      t.timestamps null: false
    end
  end
end
