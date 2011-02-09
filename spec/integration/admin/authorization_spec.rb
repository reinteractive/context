require 'spec_helper'

describe "Admin panel, authorization" do
  before do
    create_page!(:root)
  end

  def assert_denied_access
    visit context_admin_root_path
    assert_seen("You must be an admin to access that area.")
    page.current_url.should eql("http://www.example.com/")
  end

  context "anonymous user" do
    it "cannot access the admin panel" do
      assert_denied_access
    end
  end

  context "a user" do
    context "who's not an admin" do
      before do
        login!
      end

      it "cannot access the admin panel" do
        assert_denied_access
      end
    end

    context "who is an admin" do
      before do
        login!(:admin => true)
      end

      it "accesses the admin panel" do
        visit "/context/admin"
        assert_seen("Welcome to Context's admin panel.")
      end
    end
  end
end
