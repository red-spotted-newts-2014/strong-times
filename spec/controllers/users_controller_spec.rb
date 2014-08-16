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

  end
end
