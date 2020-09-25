class CreateCymbals < ActiveRecord::Migration[6.0]
  def change
    create_table :cymbals do |t|

      t.timestamps
    end
  end
end
