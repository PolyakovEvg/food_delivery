class Dish < ApplicationRecord
    has_many :dishes_ingredients
    has_many :ingredients, through: :dishes_ingredients
end
