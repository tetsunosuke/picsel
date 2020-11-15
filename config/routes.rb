Rails.application.routes.draw do
  namespace :public do
    get 'orders/new'
  end
  root 'public/users#top'
  devise_for :admins
  devise_for :users, controllers: {
    sessions: "users/sessions" ,
    registrations: "users/registrations"
  }
  namespace :public do
    resources :users, only:[:show,:edit,:update,]do
      member do
        get :following, :followers
      end
        collection do
      get "my_page"
      get "users_unsubscribe" => "userr#unsubscribe"
      delete "users_withdraw" => "users#withdraw"
    end
  end
    resources :relationships, only: [:create, :destroy]
    resources :cart_items, only:[:index,:create,:update,:destroy]
    delete "cart_items/delete_all" => "cart_items#delete_all"
    resources :orders, only:[:new,:index,:create,:show] do
    collection do
    get "confirm" 
    get "complete" 
    end
    end
    resources :book_marks, only:[:index]
    resources :gallaries, only:[:new,:index,:edit,:create,:update,:delete]
    resources :photos do
    resources :likes, only: [:index, :create, :destroy]
    end
  end


  namespace :admins do
    resources :photos
    resources :users, only:[:index,:edit,:update,:delete,:show]
    resources :order, only:[:index,:edit,:update,:show]
    resources :users, only:[:edit,:update,]
    resources :order_details, only:[:edit,:update]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
