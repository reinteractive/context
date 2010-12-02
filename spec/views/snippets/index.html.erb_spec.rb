require 'spec_helper'

describe "snippets/index.html.erb" do
  before(:each) do
    assign(:snippets, [
      stub_model(Snippet),
      stub_model(Snippet)
    ])
  end

  it "renders a list of snippets" do
    render
  end
end
