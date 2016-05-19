class ProvidersController < ApplicationController
  before_filter :admin_only, except: [:show, :edit, :update, :edit_provider, :update_provider]

  def index
    @providers = Provider.all.order("last_name ASC")
  end

  def show
    if admin_signed_in? || provider_signed_in? && (current_provider.id == params[:id].to_i)
      @provider = Provider.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(
      email: (0...8).map { (65 + rand(26)).chr }.join + "@test.com")
    @provider.save(validate: false)
    redirect_to "/provider/#{@provider.id}/edit"
  end

  def edit
    if admin_signed_in? || provider_signed_in? && (current_provider.id == params[:id].to_i)
      @provider = Provider.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def update
    if admin_signed_in? || provider_signed_in? && (current_provider.id == params[:id].to_i)
      @provider = Provider.find(params[:id])
      if @provider.update(
        username: params[:username],
	first_name: params[:first_name],
        last_name: params[:last_name],
        address_1: params[:address_1],
        address_2: params[:address_2],
        city: params[:city],
        state: params[:state],
        zip: params[:zip],
        county: params[:county],
        address_notes: params[:address_notes],
        phone: params[:phone],
        fax: params[:fax],
        email: params[:email],
        send_password_email: params[:send_password_email]
        )
        if @provider.send_password_email == true
          @provider.send_reset_password_instructions
        end
        flash[:success] = "Provider created"
        redirect_to "/"
      else
        render :edit
      end
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def edit_provider
    if admin_signed_in? || provider_signed_in? && (current_provider.id == params[:id].to_i)
      @provider = Provider.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def update_provider
    if admin_signed_in? || provider_signed_in? && (current_provider.id == params[:id].to_i)
      @provider = Provider.find(params[:id])
      if @provider.update(
        username: params[:username],
        first_name: params[:first_name],
        last_name: params[:last_name],
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
        flash[:success] = "Provider updated."
        redirect_to "/provider/#{@provider.id}"
      else
        render :edit_provider
      end
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def destroy
    if admin_signed_in?
      @provider = Provider.find(params[:id])
      @provider.destroy
      flash[:warning] = "Provider deleted."
      redirect_to "/"
    else
      redirect_to :back, alert: "Access denied."
    end
  end
end
