Rails.application.routes.draw do
  get "/", :controller => :competitions, :action => :active

  resources :competitions do
    post :guess, :on => :member
  end

  resources :winners, :only => [:create, :index] do
    get :board, :on => :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
