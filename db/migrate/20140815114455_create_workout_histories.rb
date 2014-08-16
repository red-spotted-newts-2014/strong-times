class CreateWorkoutHistories < ActiveRecord::Migration
  def change
    create_table :workout_histories do |t|

      t.references :user
      t.references :workout

      t.timestamps
    end
  end
end
