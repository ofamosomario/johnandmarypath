Rails.application.routes.draw do

  resources :breadcrumbs
  devise_for :users

  # BREADCRUMBS
  put 'breadcrumbs/update-paths-nested/:id', to: 'breadcrumbs#update_paths_nested', as: 'update_paths_nested'
  get 'dashboard', to: 'dashboards#index', as: 'dashboard'

	root 'dashboards#index'

end
