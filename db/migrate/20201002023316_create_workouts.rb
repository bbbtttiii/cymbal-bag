class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|

      t.integer :user_id
      t.integer :client_id
      t.date :date
      t.string :exercise
      t.integer :weight
      t.integer :reps
      t.integer :sets
    end
  end
end