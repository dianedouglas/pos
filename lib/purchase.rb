class Purchase < ActiveRecord::Base

  belongs_to :product
  belongs_to :checkout
  # def list_products
  # Purchase.all.each do |purchase|
  #   if self.checkout_id == @current_checkout.id
  #     purchase.products.each
  #   end
  # end
end
