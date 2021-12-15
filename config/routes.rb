Rails.application.routes.draw do
  scope "/admin" do
    resources :users
  end
  devise_for :users
  root to: 'professionals#index'
  resources :professionals do
    resources :appointments do
      collection do
        delete 'cancel-all', action: 'cancel_all'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end