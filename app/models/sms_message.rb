class SmsMessage < ActiveRecord::Base
  after_create :process

  # def process
  #   if to == '+12345678910'
  #     new_sentence = body.split.map{ |word| translate(word) }
  #     new_sentence = new_sentence.join(" ")
  #     SmsMessage.create(to: from, from: '+12345678910', body: new_sentence)
  #   else
  #     send_outgoing
  #   end
    
  # end

  # def translate(str)
  #   alpha = ('a'..'z').to_a
  #   vowels = %w[a e i o u]
  #   consonants = alpha -vowels

  #   if vowels.include?(str[0]) 
  #     str + 'ay'
  #   elsif consonants.include?(str[0]) && consonants.include?(str[1])
  #     str[2..-1] + str[0..1] + 'ay'
  #   elsif consonants.include?(str[0])
  #     str[1..-1] + str[0] + 'ay'
  #   else
  #     str
  #   end
  # end

  def send_outgoing
    client.messages.create(
      to: to,
      from: from,
      body: body
      )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new
  end

  def phone_number
    @phone_number ||= Rails.application.secrets.twilio_phone_number
  end



end

