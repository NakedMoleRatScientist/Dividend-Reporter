DividendReporter::Application.routes.draw do
  resources :stocks
  resources :users
  root :to => 'stocks#index'
end
