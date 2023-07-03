require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with all fields filled' do
      @category = Category.new({name: 'Weeds'})
      @product = @category.products.new({name: 'Weed', price: 5.99, quantity: 2})
      expect(@product).to be_valid
    end

    it 'is not valid without a name' do
      @category = Category.new({name: 'Weeds'})
      @product = @category.products.new({name: nil, price: 5.99, quantity: 2})
      expect(@product).to_not be_valid
    end
    
    it 'is not valid without a price' do
      @category = Category.new({name: 'Weeds'})
      @product = @category.products.new({name: 'Weed', quantity: 2})
      expect(@product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      @category = Category.new({name: 'Weeds'})
      @product = @category.products.new({name: 'Weed', price: 5.99, quantity: nil})
      expect(@product).to_not be_valid
    end

    it 'is not valid without a category' do
      @product = Product.new({name: 'Weed', price: 5.99, quantity: 2})
      expect(@product).to_not be_valid
    end
  end
end
