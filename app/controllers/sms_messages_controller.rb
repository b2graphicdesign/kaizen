require 'twilio-ruby'

class SmsMessagesController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def notify
    twilio_account_sid = 'AC114bed221d1bbf7393d249eb980f432d'
    twilio_auth_token = '44b3d88dd2cdc36ccd0c1cc6c4ccc9f2'
    client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

    message = client.messages.create from: '+17085016742', to: '+12244568338', body: 'Learning to send SMS you are!'

    render plain: message.status
  end


  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integratiing Twilio!', :voice => 'alice'
        r.Play 'http://linode.rabasa.com/cantina.mp3'
    end

    render_twiml response
  end

end
