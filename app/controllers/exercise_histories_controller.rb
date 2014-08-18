require 'json'

class ExerciseHistoriesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @exercise_histories = ExerciseHistory.all
  end

  def new
    @exercise_history = ExerciseHistory.new
    @workout_history = WorkoutHistory.find(params[:workout_history_id])
  end

  def create
    # @exercise_history = ExerciseHistory.find(params[:id])
    # workout_history = WorkoutHistory.find(params[:workout_history_id])

  @exercise_history = ExerciseHistory.new(exercise_history_params)
    if @exercise_history.save
      respond_to do |format|
        format.html
        format.json { render :json => { :exercise_history => @exercise_history.id } }
      end
    else
      respond_to do |format|
        format.html
        format.json { render :json => { :error => "No exercise Logged" } }
      end
    end
  end

  # def create
  #   workout_history = WorkoutHistory.find(params[:workout_history_id])
  #   @exercise_history = workout_history.exercise_histories.build(exercise_history_params)
  #   if @exercise_history.save!
  #     redirect_to user_workouts_path(current_user)
  #   else
  #     flash[:error]= "could not locate that workout history"
  #     redirect_to user_workouts_path(current_user)
  # end

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
