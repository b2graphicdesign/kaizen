class PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new
    @patient.save(validate: false)
    redirect_to patient_step_path(@patient, Patient.form_steps.first)
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
