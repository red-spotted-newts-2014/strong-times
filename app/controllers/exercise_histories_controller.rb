require 'json'

class ExerciseHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercise_histories = ExerciseHistory.all
  end

  def new
    @exercise_history = ExerciseHistory.new
    @workout_history = WorkoutHistory.find(params[:workout_history_id])
  end

  def show
    @exercise_history = ExerciseHistory.find(params[:id])
  end

  def create
     workout_history = WorkoutHistory.find(params[:workout_history_id])
    @exercise_history = workout_history.exercise_histories.build(exercise_history_params)
    if @exercise_history.save!
      redirect_to user_workouts_path(current_user)
    else
      flash[:error]= "could not locate that workout history"
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
    params.require(:exercise_history).permit(:weight, :reps, :rest_time, :distance, :running_time, :exercise_id)
  end

end
