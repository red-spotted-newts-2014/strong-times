class ExerciseHistory < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :user
  belongs_to :workout
end
