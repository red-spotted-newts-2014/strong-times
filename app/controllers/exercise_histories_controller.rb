require 'json'

class ExerciseHistoriesController < ApplicationController

  def index
    @exercise_histories = ExerciseHistory.all
  end

  def show
    @exercise_history = ExerciseHistory.find(params[:exercise_history_id])
  end

  def create
    @exercise_history = ExerciseHistory.new(params[:exercise_history])
    if @exercise_history.save!
      redirect_to exercise_history_path
    else
      flash[:error]= "could not locate that workout history"
      redirect_to new_exercise_history_path
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

  private

  def exercise_history_params
    params.require[:exercise_history].permit[:weight, :reps, :rest_time, :distance, :running_time, :exercise_id]
  end

end
