class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Authentications BugFix
  skip_before_filter :verify_authenticity_token, :only => :create

  private
    def current_user
      User.where(id: session[:user_id]).first
    end
  helper_method :current_user
end
