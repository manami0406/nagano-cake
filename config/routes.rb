Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
  end
  
  scope module: :public do
    get 'items' => 'items#index'
  end

end
