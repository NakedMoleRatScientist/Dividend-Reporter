DividendReporter::Application.routes.draw do
  get "pages/help"

  resources :stocks
  resources :users do
    member do
      get :admin
    end
  end
  resources :quotes
  resources :user_sessions
  resources :watchlists
  match 'login' =>  "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  root :to => 'stocks#index'
end
