# frozen_string_literal: true

require 'yaml'

def seed_db
  data = YAML.safe_load_file 'db/menu.yml'

  data['dishes'].each do |item|
    dish = Dish.find_or_create_by name: item['name']
    item['ingredients'].each do |ingredient_name|
      dish.ingredients << Ingredient.find_or_create_by(name: ingredient_name)
    end
  end

  data['ingredients'].each do |ingredient|
    Ingredient.find_or_create_by name: ingredient
  end

end
seed_db
