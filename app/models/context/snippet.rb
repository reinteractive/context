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
  before_validation :generate_slug_if_blank
  before_save :update_cached_path
  after_save :update_children_cached_path

  has_ancestry

  scope :published, where(:state => "published")
  scope :draft, where(:state => "draft")
  scope :ideas, where(:state => "idea")

  validates :name, :presence => true

  # Prefixes a URL with a forward slash if it doesn't already have one
  def self.prefix_slash(url)
    url = if /^\//.match(url)
      url
    else
      "/" + url
    end
    url.gsub(/\/\//,'/')
  end

  # Locate a published snippet by its path
  def self.locate(path)
    Context::Snippet.published.find_by_context_path(prefix_slash(path.to_s))
  end

  # Returns the body in HTML format, based upon the format field.
  def to_html
    case
    when self.is_html?
      self.body.html_safe
    when self.is_markdown?
      to_markdown.html_safe
    else
      self.body
    end
  end
  alias :to_s :to_html

  def to_markdown
    RDiscount.new(self.body).to_html
  end

  # Returns true if format identifies the content as HTML
  def is_html?
    # NOTE: Removing "self." causes a strange ActionView::Template::Error (too few arguments) in production
    self.format == 'text/html'
  end

  def is_markdown?
    self.format == 'text/markdown'
  end

  # Concatenates the Snippet's path.
  #
  #   snippet=Context::Snippet.first # => #<Context::Snippet id: 1, name: "test", ...,  slug: "test", path: "test">
  #   snippet/"foo/bar" # => "test/foo/bar"
  #
  # This is handy in views where you want to find a child of the current page by it's slug:
  #
  #   <%= context(@page/'sidebar') %>
  #
  def /(other)
    self.context_path + '/' + other
  end

  # before_save
  # Updates the path attribute based upon that of the parent
  def update_cached_path(force_parent_path=nil)
    if (force_parent_path || self.slug_changed?) then
      parent_path = force_parent_path || self.parent.try(:context_path)
      self.context_path=Context::Page.prefix_slash([ parent_path, self.slug ].compact.join('/'))
    end
  end
  
  def update_children_cached_path
    unless self.new_record? then
      self.children.each do |child|
        child.update_cached_path(self.context_path)
        child.save
      end
    end
  end

private
  # before_validation
  # Generates a suitable slug from the name if the slug is left blank
  def generate_slug_if_blank
    self.slug = self.name.to_s.strip.downcase.gsub(/[^A-Z0-9\-_]/i, '-').gsub(/-{2,}/,'-').gsub(/-$/, '') if self.slug.blank?
  end
end
