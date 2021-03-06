require 'twilio-ruby'

class Text
  def initialize(time_now, client)
    @time_now = time_now
    @client = client # Twilio::REST::Client
  end

  def twilio_API_client
    message = format_message()
    client = @client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'], #Twilio number
      to: ENV['TO_PHONE_NUMBER'],
      body: message
    )  
  end
  
  def format_message
    time = delivery_time()
    return message = "Thank you! Your order was placed and will be delivered before #{time}"    
  end

  def delivery_time
    current_time = @time_now
    estimated_delivery_time = current_time + (60 * 45) #In 45m
    formatted_time = "#{estimated_delivery_time.hour}:#{estimated_delivery_time.min}"
    return formatted_time
  end
end
