require 'json'

class ExercisesController < ApplicationController

  def test_api_call
    render json: Exercise.first
  end

  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def create
    # data_hash = JSON.parse(params[:exercise])
    @exercise = Exercise.new(data_hash)
    if @exercise.save!
      # redirect_to exercise_path
      render json: "Success this works"
    else
      # flash[:error]= "could not locate that workout history"
      # redirect_to new_exercise_path
       render json: "something went wrong"
    end
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(params[:exercise_params])
      redirect_to exercise_path
    else
      flash[:error]= "could not locate that exercise history"
      redirect_to edit_exercise_path
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy

    redirect_to exercise_path
  end

  private

  def exercise_params
    params.require[:exercise].permit(:workout_type, :name, :weight, :reps, :rest_time, :tempo, :distance, :running_time, :user_id, :workout_id)
  end

end
