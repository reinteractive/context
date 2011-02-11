require 'spec_helper'

describe Context::Snippet do
  before(:each) do
    @snippet=Context::Snippet.create!(:name => 'test', :body => 'I am a call to context!')
  end

  describe ".to_s" do
    it "should alias .to_html" do
      @snippet.to_s.should === @snippet.to_html
    end
  end

  describe ".to_html" do
    it "should return the body as html unsafe when format is 'text/plain'" do
      @snippet.format='text/plain'
      response=@snippet.to_html
      response.html_safe?.should == false
      response.should == @snippet.body
    end

    it "should return the body as html safe when format is 'text/html'" do
      @snippet.format='text/html'
      response=@snippet.to_html
      response.html_safe?.should == true
      response.should == @snippet.body
    end

    it "should return the body as html unsafe when format is blank" do
      @snippet.format=''
      response=@snippet.to_html
      response.html_safe?.should == false
      response.should == @snippet.body
    end

    it "should return the body as html unsafe when format is nil" do
      @snippet.format=nil
      response=@snippet.to_html
      response.html_safe?.should == false
      response.should == @snippet.body
    end
  end

  describe ".is_html?" do
    it "should return true when format is 'text/html'" do
      @snippet.format='text/html'
      @snippet.is_html?.should === true
    end

    it "should return false by when format isn't 'text/html'" do
      @snippet.is_html?.should === false
    end
  end

  describe "/ operator" do
    it "should concatenate the context_path with a string" do
      (@snippet/"foo/bar").should == "#{@snippet.context_path}/foo/bar"
    end
  end
end
