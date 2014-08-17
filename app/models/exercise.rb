class Exercise < ActiveRecord::Base
  # validates :name, presence: true
  # validates :workout_type, inclusion: { in: ["weights", "long distance running", "sprints", "calisthenics"], message: "%{value} is not a valid type"}

  belongs_to :workout

end
