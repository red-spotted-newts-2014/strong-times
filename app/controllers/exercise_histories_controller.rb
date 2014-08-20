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
    @history = {thighs: 6, chest: 4, biceps: 2, glutes: 10, abs: 20}
    @exercise_history = ExerciseHistory.find(params[:id])
  end

  def create
    exercise = Exercise.find(params[:exercise_id])
    @exercise_history = exercise.exercise_histories.build(exercise_history_params)
    if @exercise_history.save
      redirect_to exercise_exercise_histories_path(params[:exercise_id])
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
