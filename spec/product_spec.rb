require 'spec_helper'

describe Product do

  it 'should create an instance of Product.' do
    expect(test_product = Product.create({:name => 'eggs', :price => 2}))
  end

end
