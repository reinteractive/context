module Context
module ContextHelper

  # TODO: Write and document
  def context(snippet_name, options={})
    return "context() called"
  end

  # TODO: Write and document
  def context_tag(tag_name, snippet_name, options={})
    content_tag(tag_name, context(snippet_name), options)
  end

end
end
