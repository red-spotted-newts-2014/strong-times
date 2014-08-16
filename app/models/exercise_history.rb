class ExerciseHistory < ActiveRecord::Base
  belongs_to :workout_history
  belongs_to :exercise

end
