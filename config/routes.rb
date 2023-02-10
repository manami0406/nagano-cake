Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  
  scope module: :public do
    get 'items' => 'items#index'
  end
  namespace :admin do
    resources :items, only: [:new, :create, :index, :show]
  end

end
