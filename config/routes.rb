Rails.application.routes.draw do
  root "students#index"

  resources :assessments
  
  resources :students do
    resources :grades
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
