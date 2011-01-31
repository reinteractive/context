module Context
class PagesController < Context::ApplicationController
  before_filter :find_page_by_slug

  def show
    respond_to do |format|
      format.html { render :text => @page.to_html }
      # TODO: Provide to_xml, to_json, etc.
    end
  end

private
  def find_page_by_slug
    @slug=params[:path]
    @page=Page.find_by_slug(@slug)
    if @page.blank? then
      render :action => '404'
      return false
    else
      return true
    end
  end

end
end
