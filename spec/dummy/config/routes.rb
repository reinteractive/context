Dummy::Application.routes.draw do
  match "/context(.:format)", :to => "test#context", :as => :context
  match "/context_tag(.:format)", :to => "test#context_tag", :as => :context_tag
end
