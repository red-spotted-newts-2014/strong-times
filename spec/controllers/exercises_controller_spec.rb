require 'rails_helper'

describe ExercisesController, :type => :controller do

  describe "exercises" do

    it "#index" do
      get :index
      expect(assigns(:exercises)).to eq(Exercise.all)
    end

    it "#show" do
      exercise = Exercise.create(:workout_type => "weights", :name => "bench press")
      get :show, id: exercise
      expect(assigns(:exercise)).to eq(exercise)
    end

    context "#create" do
      it "creates a exercise with valid params" do
        expect{Exercise.create(:workout_type => "weights", :name => "bench press")}.to change{Exercise.count}.by(1)
      end

      it "doesn't create a exercise with invalid params" do
        expect{Exercise.create(:workout_type => "ham", :name => "bench press")}.to change{Exercise.count}.by(0)
      end
    end

    context "#update" do
      it "updates an exercise with valid params" do
        exercise = Exercise.create(:workout_type => "weights", :name => "bench press")
        exercise.update(:name => "ham")
        expect(exercise.name).to eq("ham")
      end
    end

    it "#destroy" do
      exercise = Exercise.create(:workout_type => "weights", :name => "bench press")

      expect do
        delete :destroy, id: exercise
      end.to change{Exercise.count}.by -1
    end


  end
end
