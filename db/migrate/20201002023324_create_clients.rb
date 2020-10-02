class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :height
      t.decimal :weight
      t.decimal :bodyfat
      t.text :goals
    end
  end
end
