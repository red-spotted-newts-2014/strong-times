require 'rails_helper'

describe ExerciseHistoriesController, :type => :controller do

  describe "exercise histories" do

    it "#index" do
      get :index
      expect(assigns(:exercise_histories)).to eq(ExerciseHistory.all)
    end

    xit "#show" do
      pending
      exercise_history = ExerciseHistory.create(exercise_id: 1, weight: 75)
      get :show, id: exercise_history
      expect(assigns(:exercise_history)).to eq(exercise_history)
    end

      it "creates an exercise history with valid params" do
        expect{ExerciseHistory.create(exercise_id: 1, weight: 100)}.to change{ExerciseHistory.count}.by(1)
      end

      it "updates an exercise history with valid params" do
        exercise_history = ExerciseHistory.create(exercise_id: 1, weight: 85)
        exercise_history.update(:weight => 100)
        expect(exercise_history.weight).to eq(100)
      end

  end
end
