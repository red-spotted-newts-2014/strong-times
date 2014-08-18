class Workout < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :user
  has_many :exercises

def send_specs
		specs = {}
		specs[:name] = name 
		specs[:exercises] = Hash.new()
		exercises.each do |exercise|
			specs[:exercises][exercise.name] = Hash.new()
			specs[:exercises][exercise.name][:workout_type] = exercise.workout_type unless exercise.workout_type.nil?
			specs[:exercises][exercise.name][:weight] = exercise.weight unless exercise.weight.nil?
			specs[:exercises][exercise.name][:reps] = exercise.reps unless exercise.reps.nil? 
			specs[:exercises][exercise.name][:rest_time] = exercise.rest_time unless exercise.rest_time.nil? 
			specs[:exercises][exercise.name][:tempo] = exercise.tempo unless exercise.tempo.nil?
			specs[:exercises][exercise.name][:distance] = exercise.distance unless exercise.distance.nil?
			specs[:exercises][exercise.name][:running_time] = exercise.running_time unless exercise.running_time.nil? 
		end
		specs
	end
end 
