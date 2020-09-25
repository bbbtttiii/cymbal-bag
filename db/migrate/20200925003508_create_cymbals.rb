class CreateCymbals < ActiveRecord::Migration[6.0]
  def change
    create_table :cymbals do |t|
      t.string :brand
      t.string :line
      t.string :type
      t.string :finish
      t.integer :diameter
      t.float :weight

      t.timestamps null: false
    end
  end
end
