# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140815114506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_histories", force: true do |t|
    t.integer  "weight"
    t.integer  "reps"
    t.time     "rest_time"
    t.integer  "distance"
    t.time     "time"
    t.integer  "exercises_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "weight"
    t.integer  "reps"
    t.time     "rest_time"
    t.string   "tempo"
    t.integer  "distance"
    t.time     "time"
    t.integer  "user_id"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workout_histories", force: true do |t|
    t.integer  "workouts_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
