require 'rails_helper'

RSpec.describe Product, type: :model do

  before :each do
    @category = Category.new(name: 'furniture')
    @product = @category.products.new(
      name:'Asuka',
      description:'good',
      quantity: 10,
      price: 64.99
    )
    # @product.save
  end

  describe 'Validations' do
    it "should be saved in db" do
      @product.valid? 
    end
    it "is valid with valid name" do 
      @product.name = nil
      @product.valid? 

      expect(@product.errors.full_messages).to eq(["Name can't be blank"])

    end
    it "is valid with valid price" do 
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end
    it "is valid with valid quantity" do 
      @product.quantity = nil
      expect(@product).to_not be_valid
    end
    it "is valid with valid category" do 
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end
