class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(
      email: (0...8).map { (65 + rand(26)).chr }.join + "@test.com"
      )
    @driver.save(validate: false)
    redirect_to driver_step_path(@driver, Driver.form_steps.first)
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
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
      send_password_email: params[:send_password_email]
    )
      flash[:success] = "Driver updated"
      redirect_to "/drivers/#{@driver.id}"
    else
      render :edit
    end
  end

  def destroy
  end
end
