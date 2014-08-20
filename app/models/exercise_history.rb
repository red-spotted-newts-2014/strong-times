class ExerciseHistory < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise

  def self.total_sets(user_id, exercise_id)
    total = 0
    user = User.find(user_id)
    histories = user.exercise_histories.where(exercise_id: 1)
    histories.each {|exc| total += exc.sets.to_i}
    return total
  end
end
