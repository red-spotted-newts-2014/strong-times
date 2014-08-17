class WorkoutsController < ApplicationController
  before_action :authenticate_user!


  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def create
    @workout = current_user.workouts.new(params[:workout_params])
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

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workout_path
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :user_id)
  end

end
