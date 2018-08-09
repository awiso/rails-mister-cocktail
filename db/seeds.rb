require 'json'
require 'open-uri'
puts 'Clear DB'
Ingredient.destroy_all

data = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
parsed = JSON.parse(data)

ingredients = []

puts 'Seed DB'
parsed['drinks'].each do |line|
  ing_name = line['strIngredient1']
  Ingredient.create(name: ing_name)
end
puts 'Done'
