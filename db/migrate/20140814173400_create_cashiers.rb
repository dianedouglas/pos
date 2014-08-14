class CreateCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.column :name, :string
      t.column :password, :string
    end
  end
end
