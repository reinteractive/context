module Context
module ContextHelper

  # Returns the Snippet matching the given path.
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
  # Finally, it can be called with a block like so:
  #   <%= context(:sidebar) do |sidebar| %>
  #     <h1><%= sidebar.name %></h1>
  #     <%= sidebar %>
  #   <% end %>
  #
  # The block will be evaluated only if the Snippet can be found.
  #
  def context(snippet_path, options={}, &block)
    snippet=Context::Snippet.find_by_path(snippet_path)
    if block.nil? then
      snippet
    else
      if snippet then
        capture(snippet, &block)
      end
    end
  end

  # Returns the content of the Snippet inside of a HTML element.
  # It is intended to be structured similarly to content_tag.
  #
  # Given a Snippet(:name => 'sidebar', :body => "<ul>...</ul>")
  #   <%= context_tag(:div, :sidebar, :id => :sidebar, :class => "col-1") %>
  #
  # Produces :
  #   <div id="sidebar" class="col-1"><ul>...</ul></div>
  def context_tag(tag_name, snippet_path, options={})
    content_tag(tag_name, context(snippet_path), options)
  end

end
end
