class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :ride_id
      t.integer :patient_id
      t.integer :driver_id
      t.integer :transportation_id
      t.integer :provider_id
      t.string :ride_type
      t.datetime :appointment_time
      t.datetime :expected_start_time
      t.datetime :expected_end_time
      t.decimal :expected_mileage, precision: 10, scale: 2
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
