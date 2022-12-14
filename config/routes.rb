Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root to: "homes#top"
  get "home/about" => "homes#about"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update] do
  get "search" => "users#search"
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end
  get "search" => "searches#search"
  resources :books, only: [:new, :create, :index, :show, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
  get "search_book" => "books#search_book"
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  resources :groups do
  get "join" => "groups#join"
  get "new/mail" => "groups#new_mail"
  get "send/mail" => "groups#send_mail"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

