class CreateWorkoutHistories < ActiveRecord::Migration
  def change
    create_table :workout_histories do |t|
      t.references :workouts
      t.timestamps
    end
  end
end
