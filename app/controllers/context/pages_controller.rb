module Context
class PagesController < Context::ApplicationController
  before_filter :find_page_by_slug

  def show
  end

private
  def find_page_by_slug
    @page=Page.find_by_slug(params[:path])
    if @page.blank? then
      render :action => '404'
      return false
    else
      return true
    end
  end

end
end
