class ExercisesController < ApplicationController


  def index
    @exercise = Exercise.find(params[:exercise_id])
  end

  def create
    @exercise = Exercise.new(params[:exercise])
    @exercise.save!
  end

  def edit
  end

  def destroy
  end

end
