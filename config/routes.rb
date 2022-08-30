Rails.application.routes.draw do

  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
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

  devise_scope :public do
    root to: 'public/homes#top'
    get 'about' => 'public/homes#about', as: 'about'
    get 'customers' => 'public/customers#show', as: 'customers'
  end


end
