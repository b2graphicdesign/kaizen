require 'twilio-ruby'

class SmsMessagesController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  #def create
    #SmsMessage.create(message_attributes)
    #head :ok
  #end


  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integratiing Twilio Bitches!', :voice => 'alice'
        r.Play 'http://linode.rabasa.com/cantina.mp3'
    end

    render_twiml response
  end

  private

  def message_attributes
    { 
      to: params[:To],
      from: params[:From],
      body: params[:Body].strip.downcase
    }
  end
end
