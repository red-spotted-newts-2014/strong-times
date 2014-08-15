class CreateExerciseHistories < ActiveRecord::Migration
  def change
    create_table :exercise_histories do |t|
      t.integer :weight
      t.integer :reps
      t.time    :rest_time
      t.integer :distance
      t.time    :time
      t.time    :rest_time

      t.references :exercises

      t.timestamps
    end
  end
end
