Rails.application.routes.draw do
  get 'templates/index'

  get 'templates/new'

  get 'templates/create'

  get 'templates/destroy'

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', :registrations => :registrations }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :users
  get 'contact' => 'contact_messages#new'
  resources :contact_messages, only: [:new, :create]

  resources :templates, only: [:index, :show, :new, :create, :destroy]

  HighVoltage.configure do |config|
    config.home_page = 'home'
    config.route_drawer = HighVoltage::RouteDrawers::Root
  end
  get 'guides' => 'high_voltage/pages#show', id: 'guides/index'

  %w(404 422 500).each do |code|
    get code, :to => "errors#show", :code => code
  end
end
