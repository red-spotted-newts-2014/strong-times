class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates :name, inclusion: { in: ["squats", "bench press", "deadlift", "pullups", "pushups", "rows", "curls", "squat thrusts", "skull crushers", "lunges"], message: "%{value} is not a valid type"}

   belongs_to :workout
   has_many   :exercise_histories

end
