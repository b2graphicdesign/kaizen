class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(
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
      email: params[:email],
      alert_call: params[:alert_call],
      alert_sms: params[:alert_sms],
      alert_email: params[:alert_email],
      alternate_contact_name: params[:alternate_contact_name],
      alternate_contact_phone: params[:alternate_contact_phone],
      alternate_contact_email: params[:alternate_contact_email],
      alert_alternate_call: params[:alert_alternate_call],
      alert_alternate_sms: params[:alert_alternate_sms],
      alert_alternate_email: params[:alert_alternate_email]
    )

    if @patient.save
      flash[:success] = "Patient created."
      redirect_to "/patients/#{@patient.id}"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destory
  end
  
end
