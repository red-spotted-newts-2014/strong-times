# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.email = 'test@example.com'
user.password = 'testpassword123'
user.password = 'testpassword123'
user.save!

sample_workout = Workout.create(:name => "Monday Workout", :user_id => 1)

squats = Exercise.create(:name => "squats",
                         :sets =>    "4",
                         :reps =>   "10",
                         :weight => "45",
                         :tempo =>  "30",
                         :workout_id => 1)

bench_press = Exercise.create(:name => "bench press",
                         :sets =>    "2",
                         :reps =>   "10",
                         :weight => "145",
                         :tempo =>  "30",
                         :workout_id => 1)

deadlift = Exercise.create(:name => "deadlift",
                         :sets =>    "2",
                         :reps =>   "10",
                         :weight => "250",
                         :tempo =>  "10",
                         :workout_id => 1)

pullups = Exercise.create(:name => "pullups",
                         :sets =>    "3",
                         :reps =>   "10",
                         :weight => "self",
                         :tempo =>  "5",
                         :workout_id => 1)

pushups = Exercise.create(:name => "pushups",
                         :sets =>    "2",
                         :reps =>   "10",
                         :weight => "self",
                         :tempo =>  "25",
                         :workout_id => 1)

rows = Exercise.create(:name => "rows",
                         :sets =>    "2",
                         :reps =>   "10",
                         :weight => "70",
                         :tempo =>  "5",
                         :workout_id => 1)

curls = Exercise.create(:name => "curls",
                         :sets =>    "2",
                         :reps =>   "15",
                         :weight => "50",
                         :tempo =>  "20",
                         :workout_id => 1)

squat_thrusts = Exercise.create(:name => "squat thrusts",
                         :sets =>    "2",
                         :reps =>   "10",
                         :weight => "self",
                         :tempo =>  "5",
                         :workout_id => 1)

skull_crushers = Exercise.create(:name => "skull crushers",
                         :sets =>    "2",
                         :reps =>   "12",
                         :weight => "35",
                         :tempo =>  "7",
                         :workout_id => 1)

lunges = Exercise.create(:name => "lunges",
                         :sets =>    "2",
                         :reps =>   "12",
                         :weight => "self",
                         :tempo =>  "15",
                         :workout_id => 1)

10.times do
  ExerciseHistory.create(:name => "squats",
                         :sets =>    ["2", "4", "6"].sample,
                         :reps =>   ["4", "6", "8", "10", "12"].sample,
                         :weight => ["35", "45", "55"].sample,
                         :tempo =>  ["20", "30", "40"].sample,
                         :exercise_id => 1)
end

10.times do
  ExerciseHistory.create(:name => "bench press",
                         :sets =>    ["1", "2", "3"].sample,
                         :reps =>   ["8", "10", "12"].sample,
                         :weight => ["135", "145", "155"].sample,
                         :tempo =>  ["30", "40", "50"].sample,
                         :exercise_id => 2)
end

10.times do
  ExerciseHistory.create(:name => "deadlift",
                         :sets =>    ["1", "2", "3"].sample,
                         :reps =>   ["8", "10", "12"].sample,
                         :weight => ["200", "250", "300"].sample,
                         :tempo =>  ["5", "10", "15"].sample,
                         :exercise_id => 3)
end

10.times do
  ExerciseHistory.create(:name => "pullups",
                         :sets =>   ["1", "2", "3"].sample,
                         :reps =>   ["8", "10", "12"].sample,
                         :weight => "self",
                         :tempo =>  ["5", "10", "15"].sample,
                         :exercise_id => 4)
end

10.times do
 ExerciseHistory.create(:name => "pushups",
                         :sets =>    ["1", "2", "3"].sample,
                         :reps =>   ["8", "10", "12"].sample,
                         :weight => "self",
                         :tempo =>  ["5", "10", "15"].sample,
                         :exercise_id => 5)
end

10.times do
 ExerciseHistory.create(:name => "rows",
                         :sets =>   ["1", "2", "3"].sample,
                         :reps =>   ["8", "10", "12"].sample,
                         :weight => ["60", "70", "80"].sample,
                         :tempo =>  ["5", "10", "15"].sample,
                         :exercise_id => 6)
end

10.times do
 ExerciseHistory.create(:name => "curls",
                         :sets =>   ["1", "2", "3"].sample,
                         :reps =>   ["10", "15", "16"].sample,
                         :weight => ["30", "50", "55"].sample,
                         :tempo =>  ["10", "20", "30"].sample,
                         :exercise_id => 7)
end

10.times do
 ExerciseHistory.create(:name => "squat thrusts",
                         :sets =>   ["1", "2", "3"].sample,
                         :reps =>   ["8", "10", "12"].sample,
                         :weight => "self",
                         :tempo =>  ["3", "5", "7"].sample,
                         :exercise_id => 8)
end

10.times do
  ExerciseHistory.create(:name => "skull crushers",
                         :sets =>    ["1", "2", "3"].sample,
                         :reps =>   ["8", "10", "12"].sample,
                         :weight => ["25", "35", "45"].sample,
                         :tempo =>  ["3", "5", "7"].sample,
                         :exercise_id => 9)
end

10.times do
 ExerciseHistory.create(:name => "lunges",
                        :sets => ["1", "2", "3"].sample,
                         :reps =>   ["10", "12", "14"].sample,
                         :weight => "self",
                         :tempo =>  ["10", "15", "20"].sample,
                         :exercise_id => 10)
end








