require 'rspec'
require 'dessert'


=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe "eclaire" do
  let(:eclaire) { Dessert.new("eclaire", 5, chef)}
  # let(:type) { double("eclaire")}
  # let(:quantity) { double(5) }
  let(:chef) { double("chef", name: 'Jeff') }


  describe "#initialize" do
    it "sets a type" do
      expect(eclaire.type).to eq("eclaire")
    end

    it "sets a quantity" do
      expect(eclaire.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(eclaire.ingredients).to eq([])
    end

    it "sets temperature to 60 degrees" do
      expect(eclaire.temp).to eq(60)
    end


    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("claire", "fifty", "chef")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "accepts an ingredient (string) as an arg" do
      eclaire.add_ingredient("flour")
    end

    it "adds an ingredient to the ingredients array" do
      eclaire.add_ingredient("flour")
      expect(eclaire.ingredients).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      eclaire.add_ingredient("flour")
      eclaire.add_ingredient("virgin blood")
      eclaire.add_ingredient("eye of newt")
      eclaire.add_ingredient("tear of witch")
      eclaire.add_ingredient("the soul of a whisper")
      eclaire.mix!
      expect(eclaire.ingredients).not_to eq(["flour", "virgin blood", "eye of newt", "tear of witch", "soul of a whisper"])
    end
  end

  describe "#eat" do
    it "accept a positive integer as an argument" do
      eclaire.eat(2)
    end

    it "subtracts an amount from the quantity" do
      eclaire.eat(2)
      expect(eclaire.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { eclaire.eat(6)}.to raise_error("not enough left!")
    end

  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Jeff")
      expect(eclaire.serve).to eq("Jeff has made 5 eclaires!")
    end
  end

  describe "#make_more" do
    it "calls bake on the eclaire's chef with the eclaire passed in" do
      expect(chef).to receive(:bake).with(eclaire)
      eclaire.make_more
    end
  end
end
