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
    if @transportation.save(validate: true)
      #instantiate a Twilio client
      client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']

      #create and then send an SMS message
      client.account.sms.messages.create(
        from: ENV['twilio_phone_num'],
        to: @transportation.phone,
        body: "Thanks for signing up! To verify your account, please reply VERIFY to this message.")
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
