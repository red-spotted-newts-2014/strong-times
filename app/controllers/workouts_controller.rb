class WorkoutsController < ApplicationController
  # before_action :authenticate_user!


  def index
    @workout = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def show
    @workouts = Workout.where(params[:user_id])
    @workout = Workout.find(params[:id])
    @exercises = Exercise.where(workout_id: @workout.id)
  end

  def create
    @workout = current_user.workouts.build(workout_params)
    if @workout.save!
      redirect_to new_workout_exercise_path(@workout.id)
    else
      flash[:error]= "could not locate that workout history"
      redirect_to new_workout_history_path
    end
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    @workout = Workout.find(params[:id])

    if @workout.update(workout_params)
      redirect_to user_workouts_path(params[:id])
    else
      flash[:error]= "could not locate that workout history"
      redirect_to edit_workout_path
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to user_workout_path(params[:id])
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :user_id)
  end

end
