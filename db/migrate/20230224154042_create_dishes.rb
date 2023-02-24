class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.index :name, unique: true
      t.timestamps
    end
  end
end
