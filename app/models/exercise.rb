class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates :workout_type, inclusion: { in: ["weights", "long distance running", "sprints"], message: "%{value} is not a valid type"}

  belongs_to :user
  has_many :exercise_histories

end
