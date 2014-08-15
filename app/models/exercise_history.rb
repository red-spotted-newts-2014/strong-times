class ExerciseHistory < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :user, through: :exercise
  belongs_to :workout, through: :exercise
end
