Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  resources :boards, only: [:new, :create, :show, :index]

  post "/", to: 'application#render_404'
  put "/", to: 'application#render_404'
  delete "/", to: 'application#render_404'
  patch "/", to: 'application#render_404'
  get "*a", to: 'application#render_404'
  post "*a", to: 'application#render_404'
  put "*a", to: 'application#render_404'
  delete "*a", to: 'application#render_404'
  patch "*a", to: 'application#render_404'
end
