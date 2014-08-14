class Purchase < ActiveRecord::Base

  belongs_to :product
  # def list_products
  # Purchase.all.each do |purchase|
  #   if self.checkout_id == @current_checkout.id
  #     purchase.products.each
  #   end
  # end
end
