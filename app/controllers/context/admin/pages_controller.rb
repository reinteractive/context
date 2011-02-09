class Context::Admin::PagesController < Context::Admin::BaseController
  def index
    @pages = Context::Page.all
  end
  
  def show
    @page = Context::Page.find(params[:id])
  end
  
  def new
    @pages = Context::Page.all
    @page = Context::Page.new
  end
  
  def create
    @page = Context::Page.new(params[:context_page])
    if @page.save
      flash[:notice] = "A new page has been created."
      redirect_to context_admin_pages_url
    else
      flash[:error] = "This page could not be created."
      render :action => "new"
    end
  end
end