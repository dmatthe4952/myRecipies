Rails.application.routes.draw do
  
  resources :recipes do
    resources :comments
  end
 
  root 'pages#home'

 
end
