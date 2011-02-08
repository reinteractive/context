class Context::Admin::PagesController < Context::Admin::BaseController
  def index
    @pages = Context::Page.all
  end
end