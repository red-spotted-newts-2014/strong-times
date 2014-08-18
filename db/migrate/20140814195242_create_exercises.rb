class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :sets
      t.string :reps
      t.string :weight
      t.string :tempo

      t.references :workout

      t.timestamps
    end
  end
end
