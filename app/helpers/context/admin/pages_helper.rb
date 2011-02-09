module Context
  module Admin
    module PagesHelper
      # Displays the path to the page
      def page_url(page)
        # Stops it attempting to resolve a route with / as the path, which is invalid.
        if page.path == "/"
          link_to "/", root_path
        else
          link_to "/#{page.path}", context_page_url(page.path)
        end
      end
    end
  end
end