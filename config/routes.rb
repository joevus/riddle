Rails.application.routes.draw do
  resources :competitions do
    post :guess, :on => :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
