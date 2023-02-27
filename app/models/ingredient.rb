# frozen_string_literal: true

class Ingredient < ApplicationRecord
  has_many :dishes_ingredients
  has_many :dishes, through: :dishes_ingredients
  has_many :ingredients_orders
end
