# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:dishes_orders) }
  it { should have_many(:dishes).through(:dishes_orders) }
  it { should have_db_column(:id).of_type(:integer) }
end
