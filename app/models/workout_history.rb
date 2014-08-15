class WorkoutHistory < ActiveRecord::Base
  belongs_to :workout
  belongs_to :user, through: :workout
end
