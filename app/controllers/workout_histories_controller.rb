class WorkoutHistoriesController < ApplicationController
  # before_action :authenticate_user!


  def index
    @workout_histories = WorkoutHistory.all
  end

  def show
    @workout_history = WorkoutHistory.find(params[:id])
  end

  def create
    @workout_history = WorkoutHistory.new(workout_history_params)
    if @workout_history.save!
      respond_to do |format|
        format.html
        format.json { render :json => { :workout_history_id => @workout_history.id } }
      end 
    else
      respond_to do |format|
        format.html
        format.json { render :json => { :error => "error: No workout logged" } }
      end
    end
  end

  def update
    @workout_history = WorkoutHistory.find(params[:id])

    if @workout_history.update(params[:workout_history_params])
      redirect_to workout_history_path
    else
      # flash.now[:error]= "could not locate that workout history"
      #render action:"new"
      flash[:error]= "could not locate that workout history"
      redirect_to edit_workout_history_path
    end
  end

  private

  def workout_history_params
    params.require(:workout_history).permit(:workout_id, :user_id)
  end
end
