# frozen_string_literal: true

class IngredientsOrder < ApplicationRecord
  belongs_to :order
  belongs_to :ingredient
end
