Rails.application.routes.draw do
  devise_for :users
  get 'challenge_list', to: 'pages#challenge_list', as: :challenge_list
  get 'pages/list_of_challenges'
  resources :challenges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
