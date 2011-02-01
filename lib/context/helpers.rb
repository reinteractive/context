module Context
module ContextHelper

  # Returns the Snippet matching the given name.
  # In a view, it can be used to render the content :
  #   <%= context(:sidebar) %>
  #
  # Given a Snippet(:name => 'sidebar', :body => "<ul>...</ul>")
  # Produces :
  #   <ul>...</ul>
  #
  # Because it returns the Snippet, it can also be used to help find child content :
  #   context(:news).children.last #=> Snippet(:parent => Snippet(:news))
  #
  def context(snippet_name, options={})
    Context::Snippet.find_by_name(snippet_name)
  end

  # Returns the content of the Snippet inside of a HTML element.
  # It is intended to be structured similarly to content_tag.
  #
  # Given a Snippet(:name => 'sidebar', :body => "<ul>...</ul>")
  #   <%= context_tag(:div, :sidebar, :id => :sidebar, :class => "col-1") %>
  #
  # Produces :
  #   <div id="sidebar" class="col-1"><ul>...</ul></div>
  def context_tag(tag_name, snippet_name, options={})
    content_tag(tag_name, context(snippet_name), options)
  end

end
end
