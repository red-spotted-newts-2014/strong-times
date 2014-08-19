class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
    @workout = Workout.find(params[:workout_id])
  end

  def show
    @exercise = Exercise.find(params[:id])
  end

  def create
    p "lksjlkjsdkfjsdkfjlsdkjflskdjfksjflksjflksjd"
    workout = Workout.find(params[:workout_id])
    @exercise = workout.exercises.build(exercise_params)
    if @exercise.save
        render json: @exercise.to_json
    else
      render json: "failed".to_json
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
    params.require(:exercise).permit(:workout_type, :name, :weight, :reps, :rest_time, :tempo, :distance, :running_time, :user_id, :workout_id)
  end

end
