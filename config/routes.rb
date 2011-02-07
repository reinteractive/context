Rails.application.routes.draw do
  resources :snippets

  # TODO: Probably remove these down the track???
  namespace :context do
    resource :pages, :except => :show
    match "drafts/*path", :to => 'context/pages#show'
  end

  root :to => 'context/pages#show'
  match '*path', :to => 'context/pages#show'
end
