Rails.application.routes.draw do
  root 'public/users#top'
  devise_for :admins
  devise_for :users, controllers: {
    sessions: "users/sessions" ,
    registrations: "users/registrations"
  }
  namespace :public do
    resources :users, only:[:edit,:update,]
    get "user/my_page" => "users#my_page"
    get "users_unsubscribe" => "userr#unsubscribe"
    delete "users_withdraw" => "users#withdraw"
    resources :cart_items, only:[:index,:create,:update,:destroy]
    delete "cart_items/delete_all" => "cart_items#delete_all"
    resources :orders, only:[:new,:index,:create,:show]
    get "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :book_marks, only:[:index]
    resources :gallaries, only:[:new,:index,:edit,:create,:update,:delete]
    resources :photos do 
    resources :likes, only: [:create, :destroy]
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
