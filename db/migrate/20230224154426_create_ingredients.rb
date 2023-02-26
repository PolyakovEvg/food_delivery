# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.timestamps
    end
  end
end
