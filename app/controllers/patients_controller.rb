class PatientsController < ApplicationController

  def index
    if params[:search] && admin_signed_in?
      @patients = Patient.search(params[:search]).order("last_name ASC")
    elsif admin_signed_in?
      @patients = Patient.all.order("last_name ASC")
    elsif provider_signed_in? && params[:search]
      @patients = Patient.where("provider_id = ?", current_provider.id).search(params[:search]).order("last_name ASC")
    elsif provider_signed_in?
      @patients = Patient.where("provider_id = ?", current_provider.id).order("last_name ASC")
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def new
    if admin_signed_in? || provider_signed_in?
      @patient = Patient.new
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def create
    if admin_signed_in? || provider_signed_in?
      @patient = Patient.new(patient_params)
      @patient.provider_id = current_provider.id
      @patient.save(validate: false)
      redirect_to patient_path(@patient)
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def show
    if admin_signed_in? #|| patient_signed_in? && (current_patient.id == params[:id].to_i)
      @patient = Patient.find(params[:id])
    elsif provider_signed_in? #&& (current_provider.id == patient.provider_id)
      @patient = Patient.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def edit
    if admin_signed_in? #|| patient_signed_in? && (current_patient.id == params[:id].to_i)
      @patient = Patient.find(params[:id])
    elsif provider_signed_in? #&& (current_provider.id == patient.provider_id)
      @patient = Patient.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def update
    @patient = Patient.find(params[:id])
    if admin_signed_in? #|| patient_signed_in? && (current_patient.id == params[:id].to_i)
      if @patient.update(patient_params)
        flash[:success] = "Patient Updated!"
        redirect_to "/patient/#{@patient.id}"
      else
        render :edit
      end
    elsif provider_signed_in? && (current_provider.id == @patient.provider_id)
      if @patient.update(patient_params)
        flash[:success] = "Patient Updated!"
        redirect_to patient_path @patient
      else
        render :edit
      end
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def destroy
    if admin_signed_in? || provider_signed_in?
      @patient = Patient.find(params[:id])
      @patient.destroy
      flash[:warning] = "Patient deleted."
      redirect_to :root
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  private

  def patient_params
    params.require(:patient).permit(
                              :email,
                              :first_name,
                              :last_name,
                              :address_1,
                              :address_2,
                              :city,
                              :state,
                              :zip,
                              :county,
                              :payer,
                              :payer_id,
                              :payer_state,
                              :transportation_type,
                              :phone,
                              :alert_call,
                              :alert_sms,
                              :alert_email,
                              :alternate_contact_name,
                              :alternate_contact_phone,
                              :alternate_contact_email,
                              :alert_alternate_call,
                              :alert_alternate_sms,
                              :alert_alternate_email,
                              :provider_id
                            )
  end

end
