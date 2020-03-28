Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :statistics, only: :create
  resources :players, only: [] do
    get :check_indicator, on: :member
    get :top_players, on: :collection
  end
end
