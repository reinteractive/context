module Context
  module Admin
    module PagesHelper
      # Displays the path to the page
      def page_url(page)
        link_to "/#{page.path}", page
      end
    end
  end
end