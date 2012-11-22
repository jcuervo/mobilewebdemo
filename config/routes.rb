Mobiledemo::Application.routes.draw do

  devise_for :users

  namespace :api do
    devise_for :users, :controllers => {
        :sessions => 'api/sessions'
      }, :skip => [:passwords, :confirmations, :sessions, :registrations] do
      match 'login' => 'sessions#create', :via => [:get, :post]
      match 'sessions/:id' => 'sessions#destroy', :via => :delete
    end
    resources :hit_lists, :only => [:index, :show]
  end

  resources :hit_lists, :only => [:index, :show]
  
  root :to => "home#index"
end
