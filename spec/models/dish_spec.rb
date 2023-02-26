# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dish, type: :model do
  it { should have_many(:dishes_ingredients) }
  it { should have_many(:dishes_orders) }
  it { should have_many(:orders).through(:dishes_orders) }
  it { should have_many(:ingredients).through(:dishes_ingredients) }
end
