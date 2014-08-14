require 'active_record'
require 'product'
require 'cashier'


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Product.all.each { |product| product.destroy }
    Cashier.all.each { |cashier| cashier.destroy }
  end
end
