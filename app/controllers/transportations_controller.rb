class TransportationsController < ApplicationController
  before_filter :admin_only, except: [:show, :edit, :update]

  def index
    @transportations = Transportation.all.order("company_name ASC")
  end

  def show
    transportation = Transportation.find(params[:id])
    if admin_signed_in? || transportation_signed_in? && (current_transportation.id == transportation.id)
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
      @transportation = Transportation.find_by(id: params[:id])
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
    
        #instantiate a Twilio client
        @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

        #create and then send an SMS message
        @client.account.messages.create(
          from: ENV['TWILIO_PHONE_NUMBER'],
          to: "+1#{@transportation.phone}",
          body: "Thanks for signing up! To verify your account, please reply VERIFY to this message.")

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
      @transportation = Transportation.find_by(id: params[:id])
    else
      redirect_to :back, alert: "Access denied."
    end
  end

  def update_transportation
    if admin_signed_in? || transportation_signed_in? && (current_transportation.id == params[:id])
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
  end
end
