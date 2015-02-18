Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :restaurants do        # same as --> get 'restaurants' => 'restaurants#index'
    resources :reviews
  end

  # devise_scope :user do
  #   get 'sign_out', :to => 'devise/session#destroy', :as => :destroy_user_session
  # end
  
  root to: "restaurants#index"

end
