require 'rspec'
require 'dessert'


describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("Cookie", 8, :chef)}

  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to eq("Cookie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(8)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("brownie", "lots", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("flour")
      expect(dessert.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(dessert.mix!).to receive(:shuffle!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do 
      dessert.eat(10)
      expect(dessert.quantity).to eq(18)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(100)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include(:chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
