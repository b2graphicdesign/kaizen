class SmsMessage < ActiveRecord::Base
  

  def send_outgoing
    client.messages.create(
      to: to,
      from: from,
      body: body
      )
  end


end

