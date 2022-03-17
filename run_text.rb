require 'lib/text'
require 'twilio-ruby'

new_text = Text.new(Time.now, Twilio::REST)
new_text.delivery_time
new_text.create_message
new_text.twilio_API_client

