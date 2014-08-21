require 'json'

class ExerciseHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercise_histories = ExerciseHistory.all
  end

  def new
    @exercise_history = ExerciseHistory.new
    @exercise = Exercise.find(params[:exercise_id])
  end

  def show
    @exercise_history = ExerciseHistory.find(params[:id])
    @exercise_name = @exercise_history.exercise.name
    if @exercise_name == "squats"
      @history1 = {thighs: 20, glutes: 15, abs: 10}
      @history  = {thighs: 20, glutes: 15, abs: 10}
    elsif @exercise_name == "bench press"
      @history1 = { chest: 20,  biceps: 10, abs: 5}
      @history  = { chest: 20,  biceps: 10, abs: 5}
    elsif @exercise_name == "deadlift"
      @history1 = {thighs: 5, chest: 10,  biceps: 12, glutes: 8, abs: 15}
      @history  = {thighs: 7, chest: 12,  biceps: 15, glutes: 8, abs: 15}
    elsif @exercise_name == "pullups"
      @history1 = {chest: 10,  biceps: 15, glutes: 5, abs: 15}
      @history  = {chest: 12,  biceps: 15, glutes: 5, abs:  15}
    elsif @exercise_name == "pushups"
      @history1 = {thighs: 3, chest: 18,  biceps: 10, glutes: 5, abs: 12}
      @history  = {thighs: 3, chest: 18,  biceps: 10, glutes: 5, abs: 12}
    elsif @exercise_name == "rows"
      @history1 = {thighs: 15, chest: 5,  biceps: 4, glutes: 10, abs: 8}
      @history  = {thighs: 15, chest: 5,  biceps: 4, glutes: 10, abs: 8}
    elsif @exercise_name == "curls"
      @history1 = {chest: 5,  biceps: 20}
      @history  = {chest: 5,  biceps: 20}
    elsif @exercise_name == "squat thrusts"
      @history1 = {thighs: 13, chest: 10,  biceps: 7, glutes: 15, abs: 15}
      @history  = {thighs: 13, chest: 10,  biceps: 7, glutes: 15, abs: 15}
    elsif @exercise_name == "skull crushers"
      @history1 = {chest: 5,  biceps: 10, abs: 5}
      @history  = {chest: 5,  biceps: 10, abs: 5}
    elsif @exercise_name == "lunges"
      @history1 = {thighs: 15, biceps: 12, glutes: 20, abs: 5}
      @history  = {thighs: 15, biceps: 15, glutes: 20, abs: 5}
    end

  end

  def create
    exercise = Exercise.find(params[:exercise_id])
    @exercise_history = exercise.exercise_histories.build(exercise_history_params)
    if @exercise_history.save
      redirect_to exercise_history_path(@exercise_history.id)
    else
      redirect_to user_workouts_path(current_user)
    end
  end

  def update
    @exercise_history = ExerciseHistory.find(params[:id])

    if @exercise_history.update(params[:exercise_history_params])
      redirect_to exercise_history_path
    else
      flash[:error]= "could not locate that workout history"
      redirect_to edit_exercise_history_path
    end
  end

  private

  def exercise_history_params
    params.require(:exercise_history).permit(:weight, :sets, :reps, :rest, :distance, :running_time)
  end

end
