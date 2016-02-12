class ProvidersController < ApplicationController
  
  def index
    @providers = Provider.all
  end
  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(
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

    @provider.save(validate: false)
    redirect_to "/"
  end

  def end
  end

  def update
  end
end
