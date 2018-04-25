require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Ned Gunzaliano") }
  subject(:dessert) { Dessert.new("Cake",4,chef)}


  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to be_a(Integer)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    context "errors" do
      it "raises an argument error when given a non-integer quantity" do
        expect{ Dessert.new("Garlic Cake","several",chef)}.to raise_error(ArgumentError)
      end
    end
  end

  describe "#add_ingredient" do
    before(:each) {dessert.add_ingredient("Chili Flakes")}
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to include('Chili Flakes')
    end
  end

  describe "#mix!" do
    before(:each) {dessert.add_ingredient('Garlic cloves')}
    let(:first_array) {Array.new}
    it "shuffles the ingredient array" do
      expect(dessert.ingredients).not_to eq(['Chili Flakes','Garlic Cloves'])
    end
  end

  describe "#eat" do
    before(:each) {dessert.eat(2)}
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to be < (4)
    end
    context "Error" do
      it "raises an error if the amount is greater than the quantity" do
        expect{dessert.eat(99)}.to raise_error(StandardError)
      end
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Ned Gunzaliano")

      expect(dessert.serve).to include(chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return(dessert.class)
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
