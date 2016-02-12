class TransportationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @transportation = Transportation.new
  end

  def create
    @transportation = Transportation.new(
      company_name: params[:company_name],
      username: params[:username],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      phone: params[:phone],
      email: params[:email]
      )
    if @transportation.save(validate: false)
      flash[:success] = "Transportation created"
      redirect_to "/"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
