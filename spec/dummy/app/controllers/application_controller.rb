class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    # Placeholder, re-defined in the tests
  end
end
