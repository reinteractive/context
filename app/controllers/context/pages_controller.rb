module Context
class PagesController < Context::ApplicationController
  before_filter :find_page_by_path

  # Renders the page content in the relevant layout.
  # Can be overloaded by the outside application to use a custom show layout.
  def show
    respond_to do |format|
      format.html { render :text => @page.to_html, :layout => @page.layout }
      # TODO: Provide to_xml, to_json, etc.
    end
  end

private
  def find_page_by_path
    @path=params[:path]
    @page=Page.find_by_path(@path)
    if @page.nil? then
      raise ActionController::UnknownAction
      return false
    else
      return true
    end
  end

end
end
