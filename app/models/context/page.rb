# Page is a specilisation of a Snippet that can be requested by a browser by path.
# A standard Snippet is not exposed to the web in this way.
#
# When rendered by Context::PagesController#show, by default it uses the
# application layout. This can be changed in your Page subclasses by overloading
# the layout methods.
class Context::Page < Context::Snippet

  # Returns the layout that should be rendered when shown.
  # This is provided so as that subclasses can force the page to show in a specific layout.
  # For example, if there is a "Faq" class that inherits from Page, it can always show in the "faq" layout by
  # creating a "layout" method in the Faq class.
  # Default is true, which loads the application layout.
  def layout
    true
  end
end
