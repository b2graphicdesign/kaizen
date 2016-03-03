class Patient::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Patient.form_steps

  def show
    @patient = Patient.find(params[:patient_id])
    render_wizard
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @patient.update(patient_params(step))
    render_wizard @patient
    if @patient.send_password_email == true
      @patient.send_reset_password_instructions
    end
  end

  private

  def patient_params(step)
    permitted_attributes = 
      case step
      when "basic"
        [:email, :username, :first_name, :last_name, :address_1, :address_2, :city, :state, :zip, :county, :provider_id] 
      when "payment"
        [:payer, :payer_id, :payer_state, :transportation_type]
      when "contact"
        [:phone, :alert_call, :alert_sms, :alert_email, :alternate_contact_name, :alternate_contact_phone, :alternate_contact_email, :alert_alternate_call, :alert_alternate_sms, :alert_alternate_email, :send_password_email]
      end

    params.require(:patient).permit(permitted_attributes).merge(form_step: step)
  end

end
