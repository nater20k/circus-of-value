#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './vending-item'
require_relative './vending-machine'
require 'csv'

products = []

CSV.foreach('./products.csv') do |row|
  product = VendingItem.new(row[0], row[1], row[2])
  products.push(product)
end

vendingMachine = VendingMachine.new(products)

while vendingMachine.is_on
  selection = vendingMachine.showMainMenu
  vendingMachine.handleUserInput(selection)
end
