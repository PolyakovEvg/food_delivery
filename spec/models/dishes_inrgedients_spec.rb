# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DishesIngredient, type: :model do
  it { should belong_to(:dish) }
  it { should belong_to(:ingredient) }
  it { should have_db_column(:dish_id).of_type(:integer) }
  it { should have_db_column(:ingredient_id).of_type(:integer) }
end
