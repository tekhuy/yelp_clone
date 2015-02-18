Rails.application.routes.draw do

  devise_for :users
  resources :restaurants do        # same as --> get 'restaurants' => 'restaurants#index'
    resources :reviews
  end

end
