class Context::Admin::PagesController < Context::Admin::BaseController
  before_filter :find_page, :only => [:show, :edit, :update, :destroy]
  
  def index
    @pages = Context::Page.all
  end
  
  def show
    
  end
  
  def new
    find_parent_pages
    @page = Context::Page.new
  end
  
  def create
    @page = Context::Page.new(params[:context_page])
    if @page.save
      flash[:notice] = "A new page has been created."
      redirect_to context_admin_pages_url
    else
      find_parent_pages
      flash[:error] = "This page could not be created."
      render :action => "new"
    end
  end
  
  def edit
    find_parent_pages
  end
  
  def update
    if @page.update_attributes(params[:context_page])
      flash[:notice] = "This page has been updated."
      redirect_to context_admin_page_url(@page)
    else
      find_parent_pages
      flash[:error] = "This page could not be updated."
      render :action => "edit"
    end
  end
  
  private
  
  def find_parent_pages
    # TODO: Change this to just top-level pages (maybe?)
    # Used for displaying parent pages that a page could be a child of
    @pages = Context::Page.all
  end
    
  
  def find_page
    @page = Context::Page.find(params[:id])
  end
end