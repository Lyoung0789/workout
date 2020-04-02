class CreateExercise < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :reps
      t.date :date
      t.integer :user_id
    end 
  end
end
