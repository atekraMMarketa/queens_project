Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'pages#welcome'

  resources :products do
    resources :variants
  end

  resources :documents

  resources :items do
    collection do
      post :variants
    end
  end
end
