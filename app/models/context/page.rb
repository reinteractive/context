# Page is a specilisation of a Snippet that has a URL slug
class Context::Page < Context::Snippet

  before_validation :generate_slug_if_blank
  before_save :update_cached_path

  # Returns the layout that should be rendered when shown.
  # This is provided so as that subclasses can force the page to show in a specific layout.
  # For example, if there is a "Faq" class that inherits from Page, it can always show in the "faq" layout by
  # creating a "layout" method in the Faq class.
  # Default is true, which loads the application layout.
  def layout
    true
  end

  # before_save
  # Updates the path attribute based upon that of the parent
  def update_cached_path(force_parent_path=nil)
    if force_parent_path || self.slug_changed? then
      parent_path = force_parent_path || self.parent.try(:path)
      self.path=[ parent_path, self.slug ].compact.join('/')
      self.save if force_parent_path
      self.children.each do |child|
        child.update_cached_path(self.path)
      end
    end
  end

private
  # before_validation
  # Generates a suitable slug from the name if the slug is left blank
  def generate_slug_if_blank
    self.slug = self.name.strip.downcase.gsub(/[^A-Z0-9\-_]/i, '-').gsub(/-{2,}/,'-') if self.slug.blank?
  end

end
