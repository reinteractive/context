require 'spec_helper'

describe Context::Configuration do
  it "should provide page_show_template_path" do
    Context::Configuration.should respond_to(:page_show_template_path)
  end

  it "should provide page_show_layout" do
    Context::Configuration.should respond_to(:page_show_layout)
  end

  it "should accept page_show_template_path=" do
    original=Context::Configuration.page_show_template_path
    Context::Configuration.should respond_to(:page_show_template_path=)
    Context::Configuration.page_show_template_path='foo/bar'
    Context::Configuration.page_show_template_path.should == 'foo/bar'
    Context::Configuration.page_show_template_path=original
  end

  it "should accept page_show_layout=" do
    original=Context::Configuration.page_show_layout
    Context::Configuration.should respond_to(:page_show_layout=)
    Context::Configuration.page_show_layout='special_layout'
    Context::Configuration.page_show_layout.should == 'special_layout'
    Context::Configuration.page_show_layout=original
  end
end
