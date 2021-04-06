Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: redirect('/admin')

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/posts', to: 'posts#index'
    end
  end
end
