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
  end

  def update
  end

  def destory
  end
  
end
