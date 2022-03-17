require 'dish'

RSpec.describe Dish do
  it "constructs" do
    new_dish = Dish.new("Tofu Bulgogi", 12.99)
    expect(new_dish.name).to eq "Tofu Bulgogi"
  end
end