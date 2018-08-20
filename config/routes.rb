Rails.application.routes.draw do
  get 'sessions/new'

  resources :users, only: [:new,:create,:show]

  resources :sessions,only:[:new,:create,:destroy]

  resources :feeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :feeds do
    collection do
      post :confirm
    end
  end
end
