module Context
module ContextHelper

  # TODO: Write and document
  def context(snippet_name, options={})
    snippet=Context::Snippet.find_by_name(snippet_name)
    if snippet.blank? then
      "SNIPPET NOT FOUND: #{snippet_name}"
    else
      snippet.to_html
    end
  end

  # TODO: Write and document
  def context_tag(tag_name, snippet_name, options={})
    content_tag(tag_name, context(snippet_name), options)
  end

end
end
