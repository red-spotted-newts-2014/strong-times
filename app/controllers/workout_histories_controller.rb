class WorkoutHistoriesController < ApplicationController


  def index
    @workouts_histories = WorkoutHistory.all
  end

  def show
    @workout_history = WorkoutHistory.find(params[:workout_history_id])
  end

  def create
    @workout_history = WorkoutHistory.new(params[:workout_history])
    if @workout_history.save!
      redirect_to workout_history_path
    else
      #render error
    end
  end

  def update
    @workout_history = WorkoutHistory.find(params[:id])

    if @workout_history.update(params[:workout_history_params])
      redirect_to workout_history_path
    else
      #render error
    end
  end

  private

  def workout_history_params
    params.require[:workout_history].permit[:workout_id]
  end
end
