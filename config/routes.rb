Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
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
    resources :cart_items, only: [:create, :index, :destroy] do
      collection do
        delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as:'destroy_all'
      end
    end
      
  end

end
