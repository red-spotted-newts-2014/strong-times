class WorkoutsController < ApplicationController


  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:workout_id])
  end

  def create
    @workout = Workout.new(params[:workout])
    if @workout.save!
      redirect_to workout_path
    else
      #render error
    end
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update(params[:workout_params])
      redirect_to exercise_path
    else
      #render error
    end
  end

  def destroy
  end

  private

  def workout_params
    params.require[:exercise].permit(:name, :user_id)
  end

end
