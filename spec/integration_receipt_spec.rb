require 'receipt'

RSpec.describe Receipt do
  it "produces a formatted list of what has been ordered, along with the grand total" do
    new_dishes = Dishes.new
    dish_1 = Dish.new("Chicken Curry", 9.99)
    dish_2 = Dish.new("Tofu Bulgogi", 12.99)
    new_dishes.add_dish(dish_1)
    new_dishes.add_dish(dish_2)
    new_order = Order.new
    new_order.add_to_order(dish_1, new_dishes)
    new_order.add_to_order(dish_2, new_dishes)
    new_receipt = Receipt.new(new_order)
    expect(new_receipt.produce_receipt).to eq "Thanks for your order! You have ordered:\n" +
    "Chicken Curry - £9.99\n" +
    "Tofu Bulgogi - £12.99\n" +
    "TOTAL : £22.98\n" +
    "Enjoy your meal!"
  end

  context "if no meals have been ordered" do
    it "fails" do
      new_dishes = Dishes.new
      dish_1 = Dish.new("Chicken Curry", 9.99)
      dish_2 = Dish.new("Tofu Bulgogi", 12.99)
      new_dishes.add_dish(dish_1)
      new_dishes.add_dish(dish_2)
      new_order = Order.new
      new_receipt = Receipt.new(new_order)
      expect { new_receipt.produce_receipt }.to raise_error "No dishes have been added to order."
    end
  end
end