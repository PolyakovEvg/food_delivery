# frozen_string_literal: true

class AddImgToDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :img, :string, default: 'dishes/1.jpeg'
  end
end
