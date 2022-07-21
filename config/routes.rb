Rails.application.routes.draw do

  namespace :public do
    get 'searches/search'
  end
  namespace :public do
    get 'menus/new'
    get 'menus/edit'
    get 'menus/show'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  #管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers:{
    sessions:"admin/sessions"
  }

  #ユーザー用
  devise_for :users, skip: [:passwords], controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  devise_scope :user do
    post 'users_guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about", as: 'about'
    get 'search' => "searches#search"
    resources :posts, only: [:index,:show,:edit,:create,:destroy,:update] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :users, only: [:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
    	get 'followings' => 'relationships#followings', as: 'followings'
    	get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :menus, only: [:edit,:new,:show,:create,:destroy,:update]
    get 'users/:id/menus' => "users#menus", as: 'usermenus'
    get 'mypage/show' => "users#mypage", as: 'mypage'
    get 'mypage/favo' => "users#mypagefavo", as: 'mypagefavo'
    get 'mypage/menus' => "users#mypagemenus", as: 'mypagemenus'
  end

  namespace :admin do
    devise_scope :admin do
    root "sessions#new"
    end
    get "top" => "homes#top"
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
