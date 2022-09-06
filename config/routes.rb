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

  end

  scope module: 'public' do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    get 'customers' => 'customers#show', as: 'customers'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'

  end


end
