class WorkoutsController < ApplicationController


  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:workout_id])
  end

  def create
    @workout = Workout.new(params[:workout])
    @workout.save!
  end

  def edit
  end

  def destroy
  end

end
