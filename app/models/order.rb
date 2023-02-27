# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :ingredients_orders
  has_many :ingredients, through: :ingredients_orders

  has_many :dishes_orders
  has_many :dishes, through: :dishes_orders
end
