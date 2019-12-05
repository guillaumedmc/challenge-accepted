Rails.application.routes.draw do
  get 'challenge_list', to: 'pages#challenge_list', as: :challenge_list
  get 'pages/list_of_challenges'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
