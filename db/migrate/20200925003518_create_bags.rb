class CreateBags < ActiveRecord::Migration[6.0]
  def change
    create_table :bags do |t|
      t.string :name
      t.integer :quantity
      t.integer :cymbal_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
