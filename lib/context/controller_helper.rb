module Context
  module ControllerHelper

    # Returns the current Context::Page for the given path.
    # Defaults to params[:path] if path is not provided.
    #
    # Can be used within custom actions when you still want to load the Context::Page.
    #
    #   class NewsController < ApplicationController
    #     def index
    #       @page=context_page('news')
    #       @featured=NewItem.featured.first
    #     end
    #   end
    def context_page(path=nil)
      # TODO: Should restrict to published pages
      Page.find_by_path(path ||= params[:path])
    end

  end
end
