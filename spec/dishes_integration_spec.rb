require 'dishes'
require 'dish'

RSpec.describe Dishes do
  it "adds a dish to the list of dishes" do
    new_dishes = Dishes.new
    dish_1 = Dish.new("Chicken Curry", 9.99)
    new_dishes.add_dish(dish_1)
    expect(new_dishes.list_dishes).to eq [dish_1]
  end

  it "returns a formatted list of dishes and their prices" do
    new_dishes = Dishes.new
    dish_1 = Dish.new("Chicken Curry", 9.99)
    dish_2 = Dish.new("Tofu Bulgogi", 12.99)
    new_dishes.add_dish(dish_1)
    new_dishes.add_dish(dish_2)
    expect(new_dishes.read_dish_list).to eq "Dishes to order:\n" +
    "Chicken Curry : £9.99\n" +
    "Tofu Bulgogi : £12.99\n"
  end
end