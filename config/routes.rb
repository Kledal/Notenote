Rails.application.routes.draw do
  get 'lists/new'

  devise_for :users

  resources :users, only: [:show]
  resources :lists, shallow: true do
    get 'share', on: :member
    resources :todo_items do
      get 'check', on: :member
    end
  end

  root 'home#index'
end
