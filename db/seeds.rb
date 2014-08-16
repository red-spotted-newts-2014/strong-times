# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'csv'


# Seed Users
u1 = User.create(email: "immichaelweiss@gmail.com", password: "iamstrong")
u2 = User.create(email: "anthony.edwardsjr@gmail.com", password: "iamstrong")
u3 = User.create(email: "ahardy55@gmail.com", password: "iamstrong")
u4 = User.create(email: "dykrause@gmail.com", password: "iamstrong")
u5 = User.create(email: "alan.florendo@gmail.com", password: "iamstrong")
alans_users = [u1, u2, u3, u4, u5]

# Seed Workouts
days = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
adjs = %w(Killer Crazy Heartpounder Core Weights Awesome Midlevel)
alans_users.each do |user|
  rand(4..8).times do     # Each user creates 4-8 workouts with inspring names
    day = days[rand(days.length-1)]
    adj = adjs[rand(adjs.length-1)]
    workout_name = "#{day} #{adj} Workout"
    Workout.create(user_id: user.id, name: workout_name)
  end
end

# Seed Exercises

  # Load exercise names from csv file into name_exercises array
  name_weight_exercises = []
  CSV.foreach(File.expand_path('db/exercises.csv')) do |row|
  	name_weight_exercises << row
  end

  # For each workout, load 5-15 exercises
  Workout.all.each do |workout|
    rand(5..15).times do
      exercise_type_chooser = rand(1..10) #80% chance weights, 10% LD running, 10% sprints
      if exercise_type_chooser <= 8 #weights
        ex_num = rand(name_weight_exercises.length-1)
        ex_name = name_weight_exercises[ex_num][0]
        tempo_string = "#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}"
        Exercise.create(workout_type: 'weights', workout_id: workout.id, name: ex_name, weight: rand(25..250), reps: rand(2..16), rest_time: rand(60), tempo: tempo_string)
      elsif exercise_type_chooser === 9 #long distance running
        miles = rand(5..15)
        running_time_string = "#{rand(6..10)*miles} minutes"
        Exercise.create(workout_type: 'long distance running', workout_id: workout.id, distance: miles, running_time: running_time_string)
      else # sprints
        distances = [50, 100, 200, 400, 800]
        yards = distances[rand(distances.length-1)]
        running_time_string = "#{rand(8..15)*(yards/50)} seconds"
        Exercise.create(workout_type: 'sprints', workout_id: workout.id, distance: yards, running_time: running_time_string)
      end
    end
  end

  # Each workout is done by its user 3-10 times
  rand(3..10).times do
    Workout.all.each do |workout|
      WorkoutHistory.create(user_id: workout.user_id, workout_id: workout.id)
    end
  end

  # For each WorkoutHistory, fill in the real exercise data
  # (only one fill-in per WH history--no need to do it multiple times)
  WorkoutHistory.all.each do |wh|
    wh.workout.exercises.each do |ex| # for every exercise in the WH
      if ex.workout_type == "weights"
        chance_did_exact = rand(1..10)
        if chance_did_exact <= 6 # 60% chance they did it perfectly
          ExerciseHistory.create(workout_history_id: wh.id, exercise_id: ex.id, weight: ex.weight, reps: ex.reps, rest_time: ex.rest_time)
        elsif chance_did_exact <= 9 # 30% chance they did it with variation
          actual_weight = (ex.weight * (rand(50..200)/100) ).round
          actual_reps = (ex.reps * (rand(50..200)/100) ).round
          rest_time_as_integer = ex.rest_time.to_i
          actual_rest_time = (rest_time_as_integer * (rand(50..200)/100) ).round
          ExerciseHistory.create(workout_history_id: wh.id, exercise_id: ex.id, weight: actual_weight, reps: actual_reps, rest_time: actual_rest_time)
        end # 10% chance they didn't do it (don't create an exercise history)
      elsif ex.workout_type == "long distance running"
        actual_distance = (ex.distance * (rand(80..140)/100) ).round
        actual_running_time = actual_distance * rand(7..10)
        ExerciseHistory.create(workout_history_id: wh.id, exercise_id: ex.id, distance: actual_distance, running_time: actual_running_time)
      else #sprints ==> they always sprint perfectly
        ExerciseHistory.create(workout_history_id: wh.id, exercise_id: ex.id, distance: ex.distance, running_time: ex.running_time)
      end
    end
  end



  # #Create weight exercises
  # name_weight_exercises.each do |exercise_name|
  # 	Exercise.create(
  #     workout_type: 'weights',
  # 		name: exercise_name.first.split.map(&:capitalize).join(' '),
  # 		weight: rand(25..250),
  # 		reps: rand(2..16),
  # 		rest_time: rand(60),
  # 		)
  # end
