Rails.application.routes.draw do
 resources :assignments do
   resources :tasks
 end 


  root "assignments#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
