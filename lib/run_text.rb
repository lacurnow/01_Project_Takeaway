require_relative 'text'
require 'twilio-ruby'

new_text = Text.new(Time.now, Twilio::REST::Client)
new_text.delivery_time
new_text.format_message
new_text.twilio_API_client

