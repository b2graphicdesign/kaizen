class ProvidersController < ApplicationController
  
  def index
    @providers = Provider.all
  end

  def show
    @provider = Provider.find_by(id: params[:id])
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(
      email: (0...8).map { (65 + rand(26)).chr }.join + "@test.com"
      )
    @provider.save(validate: false)
    redirect_to "/provider/#{@provider.id}/edit"
  end

  def edit
    @provider = Provider.find_by(id: params[:id])
    render :edit
  end

  def update
    @provider = Provider.find_by(id: params[:id])
    if @provider.update(
      username: params[:username],
      facility_name: params[:facility_name],
      address_1: params[:address_1],
      address_2: params[:address_2],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      county: params[:county],
      address_notes: params[:address_notes],
      phone: params[:phone],
      fax: params[:fax],
      email: params[:email]
      )
      flash[:success] = "Provider created."
      redirect_to "/"
    else
      render :edit
    end
  end
end
