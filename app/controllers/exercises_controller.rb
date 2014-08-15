class ExercisesController < ApplicationController


  def index
    @exercises = Exercise.all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def create
    @exercise = Exercise.new(params[:exercise])
    if @exercise.save!
      redirect_to exercise_path
    else
      #render error
    end
  end

  def update
    @exercise = Exercise.find(params[:id])

    if @exercise.update(params[:exercise_params])
      redirect_to exercise_path
    else
      #render error
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
