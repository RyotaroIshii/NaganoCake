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

    resources :customers

    resources :items

    get "/admin/genres" => "admin/genres#index", as: "genres"
    post "/admin/genres" => "admin/genres#create", as: "genre_create"
    get "/admin/genres/:id/edit" => "admin/genres#edit", as: "genre_edit"
    patch "/admin/genres/:id" => "admin/genres#update", as: "genre_update"


  end




  scope module: 'public' do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'

    get 'customers' => 'customers#show', as: 'customers'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'

    get 'items' => 'items#index', as: 'index_item'
    get 'items/:id' => 'items#show', as: 'show_item'


    resources :addresses

  end


end
