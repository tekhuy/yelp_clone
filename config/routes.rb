Rails.application.routes.draw do

  resources :restaurants do          # same as --> get 'restaurants' => 'restaurants#index'
    resources :reviews
  end

end
