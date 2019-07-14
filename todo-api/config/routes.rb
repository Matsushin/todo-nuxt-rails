Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :tasks, only: %i[index create]

      post 'sign_in', to: 'sessions#create'
      get 'token_current_user', to: 'sessions#token_current_user'
      get 'authencity_token', to: 'authencity_tokens#create'
    end
  end
end
