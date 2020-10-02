class CreateDrums < ActiveRecord::Migration[6.0]
  def change
    create_table :drums do |t|
      t.string :brand
      t.string :drum_model
      t.integer :diameter
      t.integer :depth
      t.string :material
      t.string :heads
      t.string :hoops
      t.string :wires
    end
  end
end