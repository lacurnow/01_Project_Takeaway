require 'text'

RSpec.describe Text do
  it "calculates the delivery time to be in 45 minutes" do
    time_dbl = Time.new(2022, 3, 17, 15, 40, 0)
    new_text = Text.new(time_dbl)
    expect(new_text.delivery_time).to eq ("16:25")
  end

  it "creates the message to be sent" do
    time_dbl = Time.new(2022, 3, 17, 15, 40, 0)
    new_text = Text.new(time_dbl)
    time = new_text.delivery_time
    expect(new_text.create_message).to eq "Thank you! Your order was placed and will be delivered before #{time}"
  end

  it "sends the message with the twilio API" do
    time_dbl = Time.new(2022, 3, 17, 15, 40, 0)
    new_text = Text.new(time_dbl)
    time = new_text.delivery_time
    requester_dbl = double :requester
    expect(requester_dbl).to receive(:new).with(ENV[TWILIO_ACCOUNT_SID], ENV[TWILIO_AUTH_TOKEN])

  end
end