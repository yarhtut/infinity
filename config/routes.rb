Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'projects#index'
  resources :projects
  resources :jobs

  namespace :admin do
    resource :users, controller: :users do
	    post :add_user_projects
      get :index
	  end
    resources :projects
    resources :admin_users
    root to: 'application#index'
  end
end
