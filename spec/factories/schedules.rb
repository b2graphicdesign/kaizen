FactoryGirl.define do
  factory :schedule do
    ride_id 1
patient_id 1
driver_id 1
transportation_id 1
provider_id 1
ride_type "MyString"
appointment_time "2016-02-21 19:41:04"
expected_start_time "2016-02-21 19:41:04"
expected_end_time "2016-02-21 19:41:04"
expected_mileage "9.99"
begin_date "2016-02-21 19:41:04"
end_date "2016-02-21 19:41:04"
  end

end
