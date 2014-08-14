class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.column :checkout_id, :int
      t.column :product_id, :int
      t.column :quantity, :int
    end
  end
end
