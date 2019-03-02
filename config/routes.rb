Rails.application.routes.draw do
  resources :snacks
  get '/pdf_metadata', to: 'snacks#pdf_metadata', as: 'endpoint', defaults: { format: :json }
  root 'snacks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
