class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :drum_id
      t.integer :user_id
      t.integer :brightness
      t.integer :resonance
      t.text :notes
    end
  end
end