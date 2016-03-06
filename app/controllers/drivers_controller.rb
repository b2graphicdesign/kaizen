class DriversController < ApplicationController

  def index
    if admin_signed_in?
      @drivers = Driver.all.order("last_name ASC")
    elsif transportation_signed_in?
      @drivers = Driver.where("transport_id = ?", current_transportation.id).order("last_name ASC")
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def show
    driver = Driver.find(params[:id])
    if admin_signed_in? || driver_signed_in? && (current_driver.id == params[:id])
      @driver = Driver.find(params[:id])
    elsif transportation_signed_in? && (current_transportation.id == driver.transport_id)
      @driver = Driver.find(params[:id])      
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def new
    if admin_signed_in? || transportation_signed_in?
      @driver = Driver.new
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def create
    if admin_signed_in? || transportation_signed_in?
      @driver = Driver.new(
        email: (0...8).map { (65 + rand(26)).chr }.join + "@test.com"
        )
      @driver.save(validate: false)
      redirect_to driver_step_path(@driver, Driver.form_steps.first)
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def edit_driver
    if admin_signed_in? || driver_signed_in? && (current_driver.id == params[:id])
      @driver = Driver.find_by(id: params[:id])
    elsif transportation_signed_in? && (current_transportation.id == driver.transport_id)
      @driver = Driver.find_by(id: params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def update_driver
    if admin_signed_in? || driver_signed_in? && (current_driver.id == params[:id])
      @driver = Driver.find_by(id: params[:id])
      if @driver.update(
        transport_id: params[:transport_id],
        username: params[:username],
        first_name: params[:first_name],
        last_name: params[:last_name],
        address_1: params[:address_1],
        address_2: params[:address_2],
        city: params[:city],
        state: params[:state],
        zip: params[:zip],
        phone: params[:phone],
        email: params[:email],
        insurance_company: params[:insurance_company],
        insurance_account: params[:insurance_account],
        drivers_license_state: params[:drivers_license_state],
        drivers_license_no: params[:drivers_license_no],
        drivers_license_expiry: params[:drivers_license_expiry],
        vehicle_year: params[:vehicle_year],
        vehicle_make: params[:vehicle_make],
        vehicle_model: params[:vehicle_model],
        vehicle_type: params[:vehicle_type],
        vehicle_color: params[:vehicle_color],
        vehicle_license_plate: params[:vehicle_license_plate],
        vehicle_registration_expiry: params[:vehicle_registration_expiry],
      )
        flash[:success] = "Driver updated"
        redirect_to "/driver/#{@driver.id}"
      else
        render :edit
      end
    elsif transportation_signed_in? && (current_transportation.id == driver.transport_id)
      @driver = Driver.find_by(id: params[:id])
      if @driver.update(
        transport_id: params[:transport_id],
        username: params[:username],
        address_1: params[:address_1],
        address_2: params[:address_2],
        city: params[:city],
        state: params[:state],
        zip: params[:zip],
        phone: params[:phone],
        email: params[:email],
        insurance_company: params[:insurance_company],
        insurance_account: params[:insurance_account],
        drivers_license_state: params[:drivers_license_state],
        drivers_license_no: params[:drivers_license_no],
        drivers_license_expiry: params[:drivers_license_expiry],
        vehicle_year: params[:vehicle_year],
        vehicle_make: params[:vehicle_make],
        vehicle_model: params[:vehicle_model],
        vehicle_type: params[:vehicle_type],
        vehicle_color: params[:vehicle_color],
        vehicle_license_plate: params[:vehicle_license_plate],
        vehicle_registration_expiry: params[:vehicle_registration_expiry],
      )
        flash[:success] = "Driver updated"
        redirect_to "/driver/#{@driver.id}"
      else
        render :edit
      end
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def destroy
    if admin_signed_in? || driver_signed_in? && (current_driver.id == params[:id])
      @driver = Driver.find(params[:id])
      @driver.destroy
      flash[:warning] = "Driver deleted"
      redirect_to "/"
    elsif transportation_signed_in? && (current_transportation.id == driver.transport_id)
      @driver = Driver.find(params[:id])
      @driver.destroy
      flash[:warning] = "Driver deleted"
      redirect_to "/"
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def ride_index
    if admin_signed_in? || driver_signed_in?
      @rides = Ride.where("driver_id = ?", current_driver.id).order("appointment_time ASC")
    elsif transportation_signed_in? && (current_transportation.id == driver.transport_id)
      @rides = Ride.where("driver_id = ?", current_driver.id).order("appointment_time ASC")
    else
      # redirect_to :back, alert: "Access denied."
    end
  end

  def ride_show
    ride = Ride.find(params[:id])
    if admin_signed_in? || driver_signed_in? && (current_driver.id == ride.driver_id)
      @ride = Ride.find(params[:id])
    elsif transportation_signed_in? && (current_transportation.id == ride.transport_id)
      @ride = Ride.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

end
