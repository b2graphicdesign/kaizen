class Ride < ActiveRecord::Base
  belongs_to :provider
  belongs_to :patient
  belongs_to :transportation
  belongs_to :driver
end
