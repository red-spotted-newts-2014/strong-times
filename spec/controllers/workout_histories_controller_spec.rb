require 'rails_helper'

describe WorkoutHistoriesController, :type => :controller do

  describe "workout history" do

    it "#index" do
      get :index
      expect(assigns(:workout_histories)).to eq(WorkoutHistory.all)
    end

     it "#show" do
      workout = WorkoutHistory.create(:user_id => 1, :workout_id => 1)
      get :show, id: workout
      expect(assigns(:workout_history)).to eq(workout)
    end

     it "creates a workout history with valid params" do
       expect{WorkoutHistory.create(:user_id => 1, :workout_id => 1)}.to change{WorkoutHistory.count}.by(1)
     end

    context "#update" do
      it "updates an workout history with valid params" do
        workout = WorkoutHistory.create(:user_id => 1, :workout_id => 1)
        workout.update(:user_id => 2)
        expect(workout.user_id).to eq(2)
      end
    end
  end
end
