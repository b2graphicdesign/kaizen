class RidesController < ApplicationController
  def index
    if admin_signed_in?
      @rides = Ride.all.order("appointment_time ASC")
    elsif provider_signed_in?
      @rides = Ride.where("provider_id = ?", current_provider.id)
    elsif patient_signed_in?
      @rides = Ride.where("patient_id = ?", current_patient.id)
    elsif transportation_signed_in?
      @rides = Ride.where("transport_id = ?", current_transportation.id)
    elsif driver_signed_in?
      @rides = Ride.where("driver_id = ?", current_driver.id)
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def new
    if admin_signed_in? || provider_signed_in? && (current_provider.id == patient.provider_id)
      @ride = Ride.new
      @patient = Patient.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def create
    if admin_signed_in? || provider_signed_in? && (current_provider.id == patient.provider_id)
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
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def show
    ride = Ride.find(params[:id])
    if admin_signed_in?
      @ride = Ride.find(params[:id])
    elsif provider_signed_in? && (current_provider.id == ride.provider_id)
      @ride = Ride.find(params[:id])
    elsif patient_signed_in? && (current_patient.id == ride.patient_id)
      @ride = Ride.find(params[:id])
    elsif transportation_signed_in? && (current_transportation.id == ride.transport_id)
      @ride = Ride.find(params[:id])
    elsif driver_signed_in? && (current_driver.id == ride.driver_id)
      @ride = Ride.find(param[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end
      
end
