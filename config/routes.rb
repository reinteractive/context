Rails.application.routes.draw do
  resources :snippets

  # TODO: Probably remove these down the track???
  namespace :context do

    namespace :admin do
      root :to => "base#index"
      resources :pages, :constraints => { :id => /.*/ } # TODO: allow for edit route, i.e. /home/edit
    end

    resource :pages, :except => :show
    match "drafts/*path", :to => 'context/pages#show'
  end

  root :to => 'context/pages#show'
  match '*path', :to => 'context/pages#show', :as => :context_page
end
