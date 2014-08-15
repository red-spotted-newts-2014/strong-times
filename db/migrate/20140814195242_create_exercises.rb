class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :type  #weights, long distance running, sprints
      t.string :name

      #attributes for weight lifting
      t.integer :weight
      t.integer :reps
      t.time    :rest_time
      t.string  :tempo

      #attributes for running
      t.integer :distance
      t.time    :time
      t.references :user
      t.references :workout

      t.timestamps


    end
  end
end
