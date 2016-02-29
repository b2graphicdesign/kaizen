class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(
      email: (0...8).map { (65 + rand(26)).chr }.join + "@test.com"
      )
    @patient.save(validate: false)
    redirect_to patient_step_path(@patient, Patient.form_steps.first)
  end

  def show
    @patient = Patient.find_by(id: params[:id])
  end

  def edit
    @patient = Patient.find_by(id: params[:id])
  end

  def update
    @patient = Patient.find_by(id: params[:id])
    if @patient.update(
      email: params[:email],
      username: params[:username],
      first_name: params[:first_name],
      last_name: params[:last_name],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      county: params[:county],
      payer: params[:payer],
      payer_id: params[:payer_id],
      payer_state: params[:payer_state],
      transportation_type: params[:transportation_type],
      phone: params[:phone],
      alert_call: params[:alert_call],
      alert_sms: params[:alert_sms],
      alert_email: params[:alert_email],
      alternate_contact_name: params[:alternate_contact_name],
      alternate_contact_phone: params[:alternate_contact_phone],
      alternate_contact_email: params[:alternate_contact_email],
      alert_alternate_call: params[:alert_alternate_call],
      alert_alternate_sms: params[:alert_alternate_sms],
      alert_alternate_email: params[:alert_alternate_email],
      send_password_email: params[:send_password_email]
      )
      
      flash[:success] = "Patient Updated!"
      redirect_to "/patients/#{@patient.id}"
    else
      render :edit
    end
  end

  def destory
  end
  
end
