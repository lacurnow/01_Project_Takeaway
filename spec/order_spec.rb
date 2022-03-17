require 'order'

RSpec.describe Order do
  it "adds a dish available in dishes to the order" do
    dish_1 = double :fake_dish
    new_dishes = double :fake_dish_menu
    allow(new_dishes).to receive(:list_dishes).and_return([dish_1])
    new_order = Order.new
    new_order.add_to_order(dish_1, new_dishes)
    expect(new_order.list_of_dishes).to eq [dish_1]
  end
end