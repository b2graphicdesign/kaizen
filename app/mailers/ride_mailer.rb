class RideMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def ride_notification_email(ride)
    @ride = ride
    #hypothetical
    mail(to: @ride.patient.email, subject: "Your ride is on the way.")
  end
end
