require 'rails_helper'

describe UsersController, :type => :controller do

  describe "users" do
    it "#index" do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end

    it "#show" do
      user = User.create(:email => "test@test5.com", :password => "testpassword123")
      get :show, id: user
      expect(assigns(:user)).to eq(user)
    end

    #create login tests when session are set up

     context "#create" do
      it "creates a user with valid params" do
        expect{User.create(:email => "fake@fakeemail123.com", :password => "testpassword123")}.to change{User.count}.by(1)
      end

      it "doesn't create a user with invalid params" do
        expect{User.create(:email => "ham", :password => "test123test")}.to change{User.count}.by(0)
      end
    end



  end
end
