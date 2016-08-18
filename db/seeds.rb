# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
fruits = %w(apple orange banana kiwii grape lemon)
entrees = %w(japanese\ curry stake)
noodles = %w(spad\ thai)
drinks = %w(milk coke sprite)
all_items = [fruits, entrees, noodles, drinks]
category_titles = ["fruit", "entree", "noodle", "drink"]

all_items.each_with_index do |category, index|
	category.each do |item_name|
		Item.create(name: item_name, price: rand.round(3)*10, description: "This is a #{item_name}", category: category_titles[index])
	end
end

special_item1 = Item.create(name: "Monday fruit", price: 11.12, description: "Only available on Mondays", category: "fruit", special_date: 1)

special_item2 = Item.create(name: "Thursday fruit", price: 2.23, description: "Only available on Thursday", category: "fruit", special_date: 4)

special_item3 = Item.create(name: "Friday entree", price: 12.53, description: "Only available on Friday", category: "entree", special_date: 5)