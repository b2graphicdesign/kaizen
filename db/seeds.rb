# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do
  Patient.create(
    :email => Faker::Internet.email,
    :first_name => Faker::Name.first_name,
    :last_name => Faker::Name.last_name,
    :address_1 => Faker::Address.street_address,
    :address_2 => Faker::Address.secondary_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state,
    :zip => Faker::Address.zip,
    :phone => Faker::PhoneNumber.phone_number,
    :payer => Faker::Name.name,
    :payer_state => Faker::Address.state,
    :payer_id => Faker::Number.number(7),
    :transportation_type => Faker::Lorem.word,
    :assistance_notes => Faker::Lorem.sentence,
    :comments => Faker::Lorem.paragraph
    )
end

5.times do
  Provider.create(
    :facility_name => Faker::Company.name,
    :address_1 => Faker::Address.street_address,
    :address_2 => Faker::Address.secondary_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state,
    :zip => Faker::Address.zip,
    :email => Faker::Internet.email,
    :phone => Faker::PhoneNumber.phone_number,
    :fax => Faker::PhoneNumber.phone_number
    )
end

5.times do
  Transportation.create(
    :company_name => Faker::Company.name,
    :address_1 => Faker::Address.street_address,
    :address_2 => Faker::Address.secondary_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state,
    :zip => Faker::Address.zip,
    :email => Faker::Internet.email,
    :phone => Faker::PhoneNumber.phone_number
    )
end
