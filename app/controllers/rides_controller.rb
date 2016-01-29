class RidesController < ApplicationController

  def new
  end

  def create
    @ride = Ride.new(params[:ride])

    respond_to do |format|
      if @ride.save
        RideMailer.ride_notification_email(@ride).deliver_now

        format.html { redirect_to(@ride, notice: 'Ride was successfully created.') }
        format.json { render json: @ride, status: :created, location: @ride }
      else
        format.html { render action: 'new' }
        format.json { render json: @ride.errors, status: :unprocessable_entity }
      end
    end
  end
end
