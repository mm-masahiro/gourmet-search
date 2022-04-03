Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/login', to: 'sessions#new'
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      resources :users
			resource :search_restaurants do
				get  :get_restaurant
				post :get_restaurant_with_genre_code
			end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
