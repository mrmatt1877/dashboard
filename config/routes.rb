Rails.application.routes.draw do
  resources :runtimes
  resources :mrpjobs
  root 'welcome#index'
  
  get 'graph/index'
  get 'graph/data', :defaults => { :format => 'json' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
