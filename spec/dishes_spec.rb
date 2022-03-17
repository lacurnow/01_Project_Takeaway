require 'dishes'

RSpec.describe Dishes do
  it "adds a dish to the list of dishes" do
    dish_dbl = double :fake_dish
    new_dishes = Dishes.new
    new_dishes.add_dish(dish_dbl)
    expect(new_dishes.list_dishes).to eq [dish_dbl]
  end

  context "if no dishes are on the list" do
    it "fails" do
    new_dishes = Dishes.new
    expect { new_dishes.list_dishes }.to raise_error "No dishes have been added."
    end
  end
end