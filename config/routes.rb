DividendReporter::Application.routes.draw do
  resources :stocks
  resources :users do
    member do
      get :admin
    end
  end
  resources :user_sessions
  match 'login' =>  "user_sessions#new", :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout
  root :to => 'stocks#index'
end
