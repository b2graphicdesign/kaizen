class TransportationsController < ApplicationController
  
  def index
    @transportations = Transportation.all
  end

  def show
    @transportation = Transportation.find_by(id: params[:id])
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
  end

  def edit_transportation
    @transportation = Transportation.find_by(id: params[:id])
  end

  def update_transportation
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
  end

  def destroy
  end
end
