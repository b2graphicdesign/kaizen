class TransportationsController < ApplicationController
  before_filter :admin_only, except: [:show, :edit, :update]

  def index
    @transportations = Transportation.all.order("company_name ASC")
  end

  def show
    if admin_signed_in? || transportation_signed_in? && (current_transportation.id == params[:id])
      @transportation = Transportation.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
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
    if admin_signed_in? || transportation_signed_in? && (current_transportation.id == params[:id])
      @transportation = Transportation.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def update
    if admin_signed_in? || transportation_signed_in? && (current_transportation.id == params[:id])
      @transportation = Transportation.find(params[:id])
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
        email: params[:email],
        send_password_email: params[:send_password_email]
        )
        if @transportation.send_password_email == true
          @transportation.send_reset_password_instructions
        end

        flash[:success] = "Transportation created"
        redirect_to "/"
      else
        render :edit
      end
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def edit_transportation
    if admin_signed_in? || transportation_signed_in? && (current_transportation.id == params[:id])
      @transportation = Transportation.find(params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def update_transportation
    if admin_signed_in? || transportation_signed_in? && (current_transportation.id == params[:id])
      @transportation = Transportation.find(params[:id])
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
        flash[:success] = "Transportation updated"
        redirect_to "/transportation/#{@transportation.id}"
      else
        render :edit_transportation
      end
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def destroy
    if admin_signed_in? || transportation_signed_in? && (current_transportation.id == params[:id])
      @transportation = Transportation.find(params[:id])
      @transportation.destroy
      flash[:warning] = "Tranportation Provider deleted."
      redirect_to "/"
    else
      redirect_to :back, alert: "Access denied."
    end
  end
end
