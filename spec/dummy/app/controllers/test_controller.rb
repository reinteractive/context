class TestController < ApplicationController
  def context
    respond_to do |wants|
      wants.html
    end
  end

  def context_tag
    respond_to do |wants|
      wants.html
    end
  end
end
