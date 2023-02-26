# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET#index' do
    before { get :index }

    context 'required output' do
      it 'render to index template' do
        is_expected.to render_template :index
      end
    end
  end

  describe 'POST#filtered' do
    let( :ingredient_ids ) { Ingredient.create }
    before { post :filtered, params: {ingredient_ids: ingredient_ids}}
    it 'render template' do
        is_expected.to render :filtered
    end
    it 'returns success status' do

    end
  end

  describe 'POST#create' do
    le
    let(:ingredient_ids) { Ingredient.create }
    before { post :filtered, params: {ingredient_ids:[]}}
    it 'render template' do
        is_expected.to render :filtered
    end
    it 'returns success status' do

    end
  end

end
