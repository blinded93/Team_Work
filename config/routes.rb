Rails.application.routes.draw do

 devise_for :users, controllers: { sessions: 'users/sessions'}

 #resources :users

 resources :assignments do
   resources :tasks do
     member do
       patch :complete
     end
   end
 end


  root "welcome#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
