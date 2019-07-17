Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :tasks, only: %i[index create update destroy]

      post 'sign_in', to: 'sessions#create'
      get 'token_current_user', to: 'sessions#token_current_user'
      get 'authencity_token', to: 'authencity_tokens#create'
    end
  end
end
