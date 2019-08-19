Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :orders, only: %i[index show] do
        post 'ship', on: :member
        resources :products, only: %i[index create]
      end
      # resources :orders, only: %i[index show] do
      #   post 'ship', on: :member
      #   resources :products, only: %i[index create], module: :orders
      # end
      # have 2 extra customer routes at /api/v1/customers => #index and #create
      resources :customers, only: %i[index create] do
        resources :orders, only: %i[index create]
      end
      # resources :customers, only: %i[index create] do
      #   resources :orders, only: %i[index create], module: :customers
      # end
      end
    end
  end

