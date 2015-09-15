Rails.application.routes.draw do
  
  resources :recipies do
    resources :comments
  end
 
  root 'pages#home'

 
end
