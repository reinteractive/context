# A Snippet is any piece of textual content within the Context system.
# A block of text in a page is a snippet, a Page is a snippet, and you can
# inherit from Context::Snippet to create your own specific types of content.
#
# Every Snippet must have a name, and a slug (which defaults to a sanitised
# version of the title if it's left blank). From there, each Snippet is assigned
# a path, according to it's position in the heirarchy.
#
# All the context helpers (eg. context() and context_tag()) look for a Snippet
# by it's path, allowing you to distinguish between "footer/links" and 
# "sidebar/links" for example.
#
class Context::Snippet < ActiveRecord::Base
  acts_as_nested_set

  before_validation :generate_slug_if_blank
  before_save :update_cached_path

  validates :name, :presence => true

  # Returns the body in HTML format, based upon the format field.
  def to_html
    case
    when self.is_html?
      self.body.html_safe
    else
      self.body
    end
  end
  alias :to_s :to_html

  # Returns true if format identifies the content as HTML
  def is_html?
    # NOTE: Removing "self." causes a strange ActionView::Template::Error (too few arguments) in production
    self.format == 'text/html'
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
    self.slug = self.name.to_s.strip.downcase.gsub(/[^A-Z0-9\-_]/i, '-').gsub(/-{2,}/,'-') if self.slug.blank?
  end
end
