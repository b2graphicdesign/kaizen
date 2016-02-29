class Driver::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Driver.form_steps

  def show
    @driver = Driver.find(params[:driver_id])
    render_wizard
  end

  def update
    @driver = Driver.find(params[:driver_id])
    @driver.update(driver_params(step))
    render_wizard @driver
    if @driver.send_password_email == true
      @driver.send_reset_password_instructions
    end
  end

  private

  def driver_params(step)
    permitted_attributes = 
      case step
      when "contact"
        [:transport_id, :username, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip, :phone, :email]
      when "licensing"
        [:insurance_company, :insurance_account, :drivers_license_state, :drivers_license_no, :drivers_license_expiry]
      when "vehicle"
        [:vehicle_year, :vehicle_make, :vehicle_model, :vehicle_type, :vehicle_color, :vehicle_license_plate, :vehicle_registration_expiry, :send_password_email]
      end

    params.require(:driver).permit(permitted_attributes).merge(form_step: step)
  end
end
