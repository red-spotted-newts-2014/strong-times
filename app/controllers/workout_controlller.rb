class WorkoutsController < ApplicationController


  def index
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
