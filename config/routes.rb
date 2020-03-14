Rails.application.routes.draw do
  get 'search' => 'users#search'

  get 'new/:id' => 'posts#new'
  post 'create/:id' => 'posts#create'
  post 'destroy/:id' => 'posts#destroy'
  post 'share/:id' => 'posts#share'

  get 'index/:id' => "users#index"
  get 'mypage/:id' => 'users#mypage'
  get 'like/:id' => 'users#like'
  post 'like/:id' => 'users#add_like'
  post 'like/destroy/:id' => 'users#destroy_like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  get 'sign_up' => 'users#sign_up'
  post 'sign_up' => 'users#user_create'
end
