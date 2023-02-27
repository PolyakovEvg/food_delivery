# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DishesOrder, type: :model do
  it { should belong_to(:dish) }
  it { should belong_to(:order) }
  it { should have_db_column(:dish_id).of_type(:integer) }
  it { should have_db_column(:order_id).of_type(:integer) }

  describe 'validations' do
    let(:order) { create(:order) }
    let(:dish) { create(:dish) }

    it 'is valid with a dish and an order' do
      dishes_order = DishesOrder.new(dish_id: dish.id, order_id: order.id)
      expect(dishes_order).to be_valid
    end

    it 'is invalid without an order' do
      dishes_order = DishesOrder.new(dish_id: dish.id)
      expect(dishes_order).to be_invalid
      expect(dishes_order.errors[:order]).to include('must exist')
    end

    it 'is invalid without a dish' do
      dishes_order = DishesOrder.new(order_id: order.id)
      expect(dishes_order).to be_invalid
      expect(dishes_order.errors[:dish]).to include('must exist')
    end
  end
end
