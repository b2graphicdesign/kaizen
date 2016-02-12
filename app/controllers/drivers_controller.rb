class DriversController < ApplicationController
  def index
  end

  def show
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
  end

  def update
  end

  def destroy
  end
end
