Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :wechat do
    controller :push do
      get '/push' => :index
      post '/push' => :data
    end

    resources :users do
      get :callback, on: :collection
    end

    resources :ticket, only: [:index] do
      get :share_test, on: :collection
    end
    
  end
end
