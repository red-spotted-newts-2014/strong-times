class WorkoutHistory < ActiveRecord::Base

  belongs_to :user
  belongs_to :workout
  has_many :exercise_histories
  # belongs_to :workout
  # belongs_to :user, through: :workout

  # AF SUGGESTIONS
  # belongs_to :workout
  # consider adding "t.references :user" to workout_history migration
end
