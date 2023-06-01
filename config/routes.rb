Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [] do
        resources :customer_subscriptions, only: [:create]
      end
    end
  end
end
