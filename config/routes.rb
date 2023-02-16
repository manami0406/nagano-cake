Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
  end
  
  scope module: :public do
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    get 'customers/:id/cancel' => 'customers#cancel', as:'cancel'
    patch 'customers/:id/withdrawal' => 'customers#withdrawal', as:'withdrawal'
  end

end
