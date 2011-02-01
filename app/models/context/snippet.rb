class Context::Snippet < ActiveRecord::Base
  acts_as_nested_set

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
end
