require 'rails_helper'

describe WorkoutsController, :type => :controller do

  describe "workouts" do

    it "#index" do
      get :index
      expect(assigns(:workouts)).to eq(Workout.all)
    end

     it "#show" do
      workout = Workout.create(:name => "Monday Workout")
      get :show, id: workout
      expect(assigns(:workout)).to eq(workout)
    end

    context "#create" do
      it "creates a workout with valid params" do
        expect{Workout.create(:name => "Tuesday Workout")}.to change{Workout.count}.by(1)
      end

      it "doesn't create a workout with invalid params" do
        expect{Workout.create(:name => nil )}.to change{Workout.count}.by(0)
      end
    end

    context "#update" do
      it "updates an workout with valid params" do
        workout = Workout.create(:name => "Wednesday Workout")
        workout.update(:name => "ham")
        expect(workout.name).to eq("ham")
      end
    end

    it "#destroy" do
      workout = Workout.create(:name => "Thursday workout")

      expect do
        delete :destroy, id: workout
      end.to change{Workout.count}.by -1
    end


  end
end
