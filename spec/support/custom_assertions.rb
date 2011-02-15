def assert_seen(string)
  page.body.should =~ Regexp.new(string)
end
