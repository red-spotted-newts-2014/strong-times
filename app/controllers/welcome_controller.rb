class WelcomeController < ApplicationController

  def index
    render :layout => "welcome"
  end
  def actions
    render :layout => nil
  end
end
