require 'spec_helper'

describe "snippets/edit.html.erb" do
  before(:each) do
    @snippet = assign(:snippet, stub_model(Snippet,
      :new_record? => false
    ))
  end

  it "renders the edit snippet form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => snippet_path(@snippet), :method => "post" do
    end
  end
end
