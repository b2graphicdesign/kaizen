class SmsMessagesController < ApplicationController
  # include Webhookable

  # after_filter :set_header

  # skip_before_action :verify_authenticity_token

  # def notify
  #   client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']

  #   message = client.messages.create from: ENV['twilio_phone_num'], to: '+12244568338', body: 'Learning to send SMS you are a boss!'

  #   render plain: message.status
  # end


  # def voice
  #   response = Twilio::TwiML::Response.new do |r|
  #     r.Say 'Hey there. Congrats on integratiing Twilio!', :voice => 'alice'
  #       r.Play 'http://linode.rabasa.com/cantina.mp3'
  #   end

  #   render_twiml response
  # end

end
