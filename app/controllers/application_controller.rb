class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_filter{ response.content_type = 'application/xhtml+xml' }
  def after_sign_in_path_for(resource)

    request.env['omniauth.origin'] || stored_location_for(resource) || user_workouts_path(current_user)
  end
end
