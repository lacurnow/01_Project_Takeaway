require 'order'

RSpec.describe Order do
  it "adds a dish available in dishes to the order" do
    dish_1 = double :fake_dish
    new_dishes = double :fake_dish_menu
    allow(new_dishes).to receive(:list_dishes).and_return([dish_1])
    new_order = Order.new
    new_order.add_to_order(dish_1, new_dishes)
    expect(new_order.list_of_dishes_on_order).to eq [dish_1]
  end

  it "removes a dish from the order list" do
    new_dishes = double :fake_dish_menu
    dish_1 = double :fake_dish
    dish_2 = double :fake_dish
    allow(new_dishes).to receive(:list_dishes).and_return([dish_1, dish_2])
    new_order = Order.new
    new_order.add_to_order(dish_1, new_dishes)
    new_order.add_to_order(dish_2, new_dishes)
    new_order.remove_from_order(dish_1)
    expect(new_order.list_of_dishes_on_order).to eq [(dish_2)]
  end

  context "if a dish hasn't been added to the order list" do
    it "fails" do
      new_dishes = double :fake_dish_menu
      dish_1 = double :fake_dish
      dish_2 = double :fake_dish
      allow(new_dishes).to receive(:list_dishes).and_return([dish_1, dish_2])
      new_order = Order.new
      new_order.add_to_order(dish_2, new_dishes)
      expect { new_order.remove_from_order(dish_1) }.to raise_error "This dish hasn't been ordered."
    end
  end
end