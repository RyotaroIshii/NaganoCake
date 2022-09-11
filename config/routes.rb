Rails.application.routes.draw do

  scope module: 'public' do
    get 'customers/edit' => 'customers#edit'
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  namespace :admin do
    root to: 'homes#top'

    resources :customers, only: [:index, :show, :edit, :update]

    resources :items, only: [:new, :create, :index, :show, :edit, :update]

    get "genres" => "genres#index", as: "genres"
    post "genres" => "genres#create", as: "genre_create"
    get "genres/:id/edit" => "genres#edit", as: "genre_edit"
    patch "genres/:id" => "genres#update", as: "genre_update"


  end




  scope module: 'public' do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'

    get 'customers' => 'customers#show', as: 'customers'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'

    get 'items' => 'items#index', as: 'index_item'
    get 'items/:id' => 'items#show', as: 'show_item'

    get 'cart_items' => 'cart_items#index', as: 'cart'
    post "cart_items" => "cart_items#create", as: "create_cart_item"
    patch "cart_items/:id" => "cart_items#update", as: "update_cart_item"
    delete "cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all_cart_items"
    delete "cart_items/:id" => "cart_items#destroy", as: "destory_cart_item"

    resources :addresses

  end


end
