require 'json'

class ExerciseHistoriesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @exercise_histories = ExerciseHistory.all
  end

  def show
    @exercise_history = ExerciseHistory.find(params[:id])
  end

  def create
    puts params[:exercise_history][:reps]
        @exercise_history = ExerciseHistory.new(exercise_history_params)
    if @exercise_history.save!
      puts @exercise_history
      respond_to do |format|
        format.html
        format.json { render :json => { :exercise_history => @exercise_history } }
      end
      # redirect_to exercise_history_path
    else
      respond_to do |format|
        format.html
        format.json { render :json => { :error => "error" } }
      end
    end
  end

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
    params.require(:exercise_history).permit(:weight, :reps, :rest_time, :distance, :running_time, :workout_history_id, :exercise_id)
  end

end
