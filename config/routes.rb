Rails.application.routes.draw do

  resources :restaurants          # same as --> get 'restaurants' => 'restaurants#index'
  
  resources :new_restaurant      #get 'restaurants/new' => 'restaurants#new'

end
