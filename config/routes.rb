Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'         # ルートパス
  # get 'blogs'  => 'blogs#index'
  # get 'blogs/new' => 'blogs#new'    # 投稿画面
  # post 'blogs' => 'blogs#create'    # blog投稿機能
  # delete 'blogs/:id' => 'blogs#destroy'
  # get  'blogs/:id/edit' => 'blogs#edit'
  # get  'blogs/:id' => 'blogs#show'
  resources :blogs
end
