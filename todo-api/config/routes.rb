Rails.application.routes.draw do
  root to: 'health#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :tasks, only: %i[index create update show destroy]

      post 'sign_in', to: 'sessions#create'
      get 'token_current_user', to: 'sessions#token_current_user'
      get 'authencity_token', to: 'authencity_tokens#create'

      post 'cron/send_test_mail_job', to: 'cron#send_test_mail_job'
      post 'cron/test_batch_job', to: 'cron#test_batch_job'
    end
  end
end
