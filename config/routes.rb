require 'sidekiq/web'

Luxhotels::Application.routes.draw do

  devise_for :users

  mount Sidekiq::Web, at: '/sidekiq'

  resources :hotels

  match '/city/:city_id', to: 'locations#city', as: 'city'

  match '/country/:country_id', to: 'locations#cities', as: 'country'

  match '/countries', to: 'locations#countries', as: 'countries'

  match '/admin', to: 'admin#index'

  match '/admin/build_all', to: 'miners#mine_hotels'

  match '/admin/delete_all', to: 'miners#destroy_all_hotels'

  match '/admin/delete_hotels', to: 'miners#destroy_hotels'

  match 'admin/construct_hotels', to: 'miners#construct_hotels'

  root :to => 'hotels#index'
end
