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
      flash[:error]= "could not locate that workout history"
      redirect_to new_workout_history_path
    end
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update(params[:workout_params])
      redirect_to exercise_path
    else
      flash[:error]= "could not locate that workout history"
      redirect_to edit_workout_path
    end
  end

  private

  def workout_params
    params.require[:workout].permit(:name, :user_id)
  end

end
