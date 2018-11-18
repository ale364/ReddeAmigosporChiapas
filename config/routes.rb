Rails.application.routes.draw do
  devise_for :users
  resources :sitios do
    resources :reviews
  end

  root to: 'sitios#index'
end
