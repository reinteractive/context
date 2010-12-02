module SnippetsHelper

  # Returns an array of all Snipets suitable to be used for a select input
  def snippets_for_select
    result=[]
    Snippet.roots.each do |snippet|
      Snippet.each_with_level(snippet.self_and_descendants) do |child, level|
        text=("-" * level) + " " + child.name
        result << [ text, child.id ]
      end
    end
    result
  end
end
