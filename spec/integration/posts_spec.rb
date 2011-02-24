require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

# Post is a model inheriting from Context::Page in the dummy application
describe "posts" do
  let(:post) do
    Post.create!(:name      => "Poster Child",
                 :body      => "This is the body of the 'Poster Child' page",
                 :state     => "published")
  end

  it "is found as an object as a subclass of Context::Page" do
    visit post.context_path
    assert_seen "This is the body of the 'Poster Child' page"
  end
end
