class WorkoutHistoriesController < ApplicationController


  def index
    @workouts_histories = Workout_history.all
  end

  def show
    @workout_history = Workout_history.find(params[:workout_history_id])
  end

  def create
    @workout_history = Workout_history.new(params[:workout_history])
    @workout_history.save!
  end

  def edit
  end

  def destroy
  end

end
