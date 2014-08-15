class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :workout_type  #weights, long distance running, sprints
      t.string :name

      #attributes for weight lifting
      t.integer :weight
      t.integer :reps
      t.string  :rest_time
      t.string  :tempo

      #attributes for running
      t.integer   :distance
      t.string    :running_time
      t.references :user
      t.references :workout

      t.timestamps


    end
  end
end
