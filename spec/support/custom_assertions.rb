def assert_seen(string)
  page.has_content?(string).should be_true
end