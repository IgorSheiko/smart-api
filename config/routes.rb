Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'rails_admin/main#dashboard'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resource :auth, controller: :auth, only: [] do
        collection do
          post :sign_in, :sign_out, :sign_up
        end
      end

      resources :users, only: [:update, :show]

      resources :validations, only: [] do
        collection do
          get :auth_exists
          get :email_exists
          get :password_valid
          get :phone_number_valid
        end
      end

      resources :systems, only: [:index]

      resources :room_categories, only: [:index]

      resources :projects, only: [:create, :index]

    end
  end

end
