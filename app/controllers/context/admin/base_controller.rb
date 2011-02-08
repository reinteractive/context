class Context::Admin::BaseController < ApplicationController
  before_filter :context_admin_required
  
  def index
    
  end
  
  private
  
  def context_admin_required
    p "CALLING CONTEXT ADMIN REQUIRED"
    if !current_user.try(:context_admin)
      flash[:notice] = "You must be an admin to access that area."
      redirect_to '/'
    end
  end
end