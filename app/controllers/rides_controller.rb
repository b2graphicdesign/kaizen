class RidesController < ApplicationController
  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
    @patient = Patient.find(params[:id])
  end

  def create
    appointment_time = DateTime.strptime(params[:appointment_time], "%m/%d/%Y %H:%M %P").to_time
    expected_start_time = DateTime.strptime(params[:expected_start_time], "%m/%d/%Y %H:%M %P").to_time    
    expected_end_time = DateTime.strptime(params[:expected_end_time], "%m/%d/%Y %H:%M %P").to_time    

    @ride = Ride.new(
      patient_id: params[:patient_id],
      provider_id: params[:provider_id],
      appointment_time: appointment_time,
      expected_start_time: expected_start_time,
      expected_end_time: expected_end_time,
      expected_mileage: params[:expected_mileage],
      ride_type: params[:ride_type]
      )

    # respond_to do |format|
    #   if @ride.save
    #     RideMailer.ride_notification_email(@ride).deliver_now

    #     format.html { redirect_to(@ride, notice: 'Ride was successfully created.') }
    #     format.json { render json: @ride, status: :created, location: @ride }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @ride.errors, status: :unprocessable_entity }
    #   end
    # end
    if @ride.save
      redirect_to "/rides"
    else
      render :new
    end
  end
end
