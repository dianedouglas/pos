require 'spec_helper'

describe Product do

  it 'has many purchases' do
    test_product = Product.create({:name => "Vanilla Pepsi", :price => 1})
    # test_purchase = Purchase.create({:quantity => 1})
    # test_product.purchases << test_purchase
    test_purchase = test_product.purchases.create({:quantity => 1})
    expect(test_product.purchases).to eq [test_purchase]
  end
end
