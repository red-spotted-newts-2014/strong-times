class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :type  #weights, long distance running, sprints
      t.string :name

      #attributes for weight lifting
      t.integer :goal_weight
      t.integer :goal_reps
      t.time    :goal_rest_time
      t.string  :tempo
      t.integer :performed_weight
      t.integer :performed_reps
      t.time    :performed_rest_time

      #attributes for running
      t.integer :goal_distance
      t.time    :goal_time
      t.time    :goal_rest_time #only for sprints
      t.integer :performed_distance
      t.time    :performed_time
      t.time    :performed_rest_time

      t.references :user
      t.references :workout

      t.timestamps


    end
  end
end
