class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def login_first!
    if !logged_in?
      redirect_to new_session_path, notice: "Please Login to view that page!"
    end
  end
end
