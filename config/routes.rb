Rails.application.routes.draw do

  post 'user_token' => 'user_token#create'
  root to:'home#index'

  get '/about', :to => 'home#about', as:'about'

  #Routes NameSpace Login
    namespace "auth" do
      get '/login/', to:'authenticate#index', as:'_login'
      get '/recovery', to:'authenticate#recovery', as:'_recovery'
      end
  #Fin

  #Routes NameSpace Administrator
    namespace "admin" do
      get '/administrator', :to =>'administrator#index', as:'index'
      get '/usuarios', :to => 'administrator#usuarios', as:'user'
    end
  #Fin


  #Api Routes
    namespace "api" do
      namespace "v1" do
        namespace "auth" do
          post 'login', to: 'authentication#authenticate'
          post 'signup', to: 'authentication#create'
          get 'user', to: 'authentication#show'
        end

        namespace "admin" do
          resources :clients do
            resources :companies
            resources :phones
          end
          resources :users do
            resources :phones
          end
          resources :roles
          resources :sections
        end
      end
    end
  #fin

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
