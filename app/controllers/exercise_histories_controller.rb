class ExerciseHistoriesController < ApplicationController


  def index
    @exercise_history = Exercise_history.find(params[:exercise_history_id])
  end

  def create
    @exercise_history = Exercise_history.new(params[:exercise_history])
    @exercise_history.save!
  end

  def edit
  end

  def destroy
  end

end
