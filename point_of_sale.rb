require 'active_record'
require './lib/product'
require './lib/cashier'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Hi there! Welcome to our POS thingy."
  main_menu
end

def main_menu
  selection = nil
  until selection == 'x'
    puts "Press [p] to create a product."
    puts "Press [i] to print product inventory."
    puts "Press [ep] to edit a product."
    puts "Press [c] to create a cashier."
    puts "Press [lc] to list all the cashiers."
    puts "Press [ec] to edit a cashier."
    puts "Press [x] to exit."
    selection = gets.chomp.downcase
    case selection
    when 'p'
      create_product
    when 'i'
      print_products
    when 'ep'
      edit_product
    when 'c'
      create_cashier
    when 'lc'
      print_cashiers
    when 'ec'
      edit_cashier
    else
      if selection != 'x'
        puts "Invalid. You fail at life."
      end
    end
  end
    puts "Goodbye!"
    exit
end

def create_cashier
  puts "Enter the name of the cashier:"
  name = gets.chomp
  puts "Assign them a password:"
  password = gets.chomp
  @current_cashier = Cashier.create({:name => name, :password => password})
  print_cashiers
end

def print_cashiers
  Cashier.all.each do |cashier|
    puts cashier.name
    puts "Password: " + cashier.password
    puts ""
  end
end

def print_cashier
  puts ""
  puts @current_cashier.name
  puts "Password: " + @current_cashier.password
  puts ""
end

def select_cashier
  print_cashiers
  puts "Please type in a cashier name to select them."
  drone_name = gets.chomp
  @current_cashier = Cashier.find_by({:name => drone_name})
end

def edit_cashier
  select_cashier
  puts "You have selected: "
  print_cashier
  edit_cashier_menu
end

def edit_cashier_menu
  puts "Press [d] to delete the cashier."
  puts "Press [n] to edit thier name."
  puts "Press [p] to edit thier password."
  puts "Press [m] to return to the main menu."
  edit_choice = nil
  until edit_choice == 'm'
  edit_choice = gets.chomp

    case edit_choice
    when 'd'
      @current_cashier.destroy
      print_cashiers
      edit_cashier_menu
    when 'n'
      puts "Enter new name:"
      name = gets.chomp
      @current_cashier.name = name
      @current_cashier.save
      print_cashier
      edit_cashier_menu
    when 'p'
      puts "change password!"
      puts "Enter new password:"
      password = gets.chomp
      @current_cashier.password = password
      @current_cashier.save
      edit_cashier_menu
    else
      if edit_choice != 'm'
        puts "Invalid entry. Do it again."
        edit_cashier_menu
      end
    end
  end
      puts "Back we go!"
      sleep 1
      main_menu

end

def create_product
  puts "Enter the name of the product:"
  name = gets.chomp
  puts "Enter the price:"
  price = gets.chomp.to_i
  @current_product = Product.create({:name => name, :price => price})
  print_products
end

def print_products
  Product.all.each do |prod|
    puts prod.name
    puts "$" + prod.price.to_s
    puts ""
  end
end

def print_product
  puts ""
  puts @current_product.name
  puts "$" + @current_product.price.to_s
  puts ""
end

def select_product
  print_products
  puts "Please type in a product name to select it."
  product_name = gets.chomp
  @current_product = Product.find_by({:name => product_name})
end

def edit_product
  select_product
  puts "You have selected: "
  print_product
  edit_menu
end

def edit_menu
  puts "Press [d] to delete the product."
  puts "Press [n] to edit its name."
  puts "Press [p] to edit its price."
  puts "Press [m] to return to the main menu."
  edit_choice = nil
  until edit_choice == 'm'
  edit_choice = gets.chomp

    case edit_choice
    when 'd'
      @current_product.destroy
      print_products
      edit_menu
    when 'n'
      puts "Enter new name:"
      name = gets.chomp
      @current_product.name = name
      @current_product.save
      print_product
      edit_menu
    when 'p'
      puts "change price!"
      puts "Enter new price:"
      price = gets.chomp.to_i
      @current_product.price = price
      @current_product.save
      edit_menu
    else
      if edit_choice != 'm'
        puts "Invalid entry. Do it again."
        edit_menu
      end
      puts "Back we go!"
      sleep 1
      main_menu
    end
  end

end
welcome
