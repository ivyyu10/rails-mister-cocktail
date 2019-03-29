Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'cocktails#index'
  resources :cocktails, except: [:edit, :update] do
    resources :doses, shallow: true

    resources :doses, only: :destroy

  end
  root to: 'cocktails#index'
end
