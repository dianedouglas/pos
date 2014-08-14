require 'spec_helper'

describe Purchase do

  it 'belongs to product.' do
    test_product = Product.create({:name => "Vanilla Pepsi", :price => 1})
    test_cashier = Cashier.create({:name => "Lee", :password => 'nil'})
    test_customer = Customer.create()
    test_checkout = Checkout.create({:cashier_id => test_cashier.id, :customer_id => test_customer.id, :date => nil})
    test_purchase = Purchase.create({:checkout_id => test_checkout.id, :product_id => test_product.id, :quantity => 1})
    expect(test_purchase.product).to eq test_product
  end
end
