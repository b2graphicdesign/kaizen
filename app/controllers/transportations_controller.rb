class TransportationsController < ApplicationController
  
  def index
    @transportations = Transportation.all
  end

  def show
  end

  def new
    @transportation = Transportation.new
  end

  def create
    @transportation = Transportation.new(
      email: (0...8).map { (65 + rand(26)).chr }.join + "@test.com"
      )
    @transportation.save(validate: false)
    redirect_to "/transportation/#{@transportation.id}/edit"
  end

  def edit
    @transportation = Transportation.find_by(id: params[:id])
  end

  def update
    @transportation = Transportation.find_by(id: params[:id])
    if @transportation.update(
      company_name: params[:company_name],
      username: params[:username],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      phone: params[:phone],
      fax: params[:fax],
      email: params[:email]
      )
      flash[:success] = "Transportation created"
      redirect_to "/"
    else
      render :edit
    end
  end

  def destroy
  end
end
