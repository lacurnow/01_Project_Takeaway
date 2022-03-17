require 'order'
require 'dishes'
require 'dish'

RSpec.describe Order do
  it "adds a dish available in dishes to the order" do
    new_dishes = Dishes.new
    dish_1 = Dish.new("Chicken Curry", 9.99)
    dish_2 = Dish.new("Tofu Bulgogi", 12.99)
    new_dishes.add_dish(dish_1)
    new_dishes.add_dish(dish_2)
    new_order = Order.new
    new_order.add_to_order(dish_1, new_dishes)
    expect(new_order.list_of_dishes).to eq [dish_1]
  end

  context "if a dish is not avaiable" do
    it "fails" do
      new_dishes = Dishes.new
      dish_1 = Dish.new("Chicken Curry", 9.99)
      dish_2 = Dish.new("Tofu Bulgogi", 12.99)
      new_dishes.add_dish(dish_1)
      new_order = Order.new
      expect { new_order.add_to_order(dish_2, new_dishes) }.to raise_error "This dish is not currently available"
    end
  end
end