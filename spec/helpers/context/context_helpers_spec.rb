require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the SnippetsHelper. For example:
#
# describe SnippetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe Context::ContextHelper do
  describe "context" do
    it "should find the Snippet by name and return it directly" do
      snippet=Context::Snippet.new(:name => 'sidebar')
      Context::Snippet.should_receive(:find_by_name).with(:sidebar).and_return(snippet)
      helper.context(:sidebar).should == snippet
    end

    it "should return nil if the Snippet can't be found" do
      helper.context(:sidebar).should be_nil
    end
  end

  describe "context_tag" do
    it "should find the Snippet by name and return it wrapped in the element" do
      snippet=Context::Snippet.new(:name => 'sidebar')
      snippet.should_receive(:to_s).and_return("Content")
      Context::Snippet.should_receive(:find_by_name).with(:sidebar).and_return(snippet)
      helper.context_tag(:div, :sidebar).should == "<div>Content</div>"
    end

    it "should pass the HTML options through"

    it "should return an empty element if the Snippet can't be found" do
      helper.context_tag(:div, :sidebar).should == "<div></div>"
    end
  end
end
