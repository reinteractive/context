# Page is a specilisation of a Snippet that has a URL slug
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
