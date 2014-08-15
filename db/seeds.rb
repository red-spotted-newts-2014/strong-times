# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

name_exercises = []
CSV.foreach(File.expand_path('db/exercises.csv')) do |row|
	name_exercises << row
end


#Create weight exercises
name_exercises.each do |exercise_name|
	Exercise.create(
    workout_type: 'weights',
		name: exercise_name.first.split.map(&:capitalize).join(' '),
		weight: rand(25..250),
		reps: rand(2..16),
		rest_time: rand(60),
		tempo: '3010'
		)
end
