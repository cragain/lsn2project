PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  
  resources :categories, except: [:destroy]
  
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create, :show]
  end
end
