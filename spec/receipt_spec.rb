require 'receipt'

RSpec.describe Receipt do
  it "produces a formatted list of what has been ordered, along with the grand total" do
    new_dishes = double :fake_dish_list
    dish_1 = double :fake_dish_1
    dish_2 = double :fake_dish_2
    new_order = double :fake_order
    expect(new_order).to receive(:list_of_dishes_on_order).and_return([dish_1, dish_2])
    expect(dish_1).to receive(:name).and_return("Chicken Curry")
    expect(dish_1).to receive(:price).and_return(9.99)
    expect(dish_2).to receive(:name).and_return("Tofu Bulgogi")
    expect(dish_2).to receive(:price).and_return(12.99)
    new_receipt = Receipt.new(new_order)
    expect(new_receipt.produce_receipt).to eq "Thanks for your order! You have ordered:\n" +
    "Chicken Curry - £9.99\n" +
    "Tofu Bulgogi - £12.99\n" +
    "TOTAL : £22.98\n" +
    "Enjoy your meal!"
  end

  context "if no meals have been ordered" do
    it "fails" do
      new_order = double :fake_order
      new_receipt = Receipt.new(new_order)
      expect(new_order).to receive(:list_of_dishes_on_order).and_return([])
      expect { new_receipt.produce_receipt }.to raise_error "No dishes have been added to order."
    end
  end
end