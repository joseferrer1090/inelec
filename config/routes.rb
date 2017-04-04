Rails.application.routes.draw do
  
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
      get '/administrator', to:'administrator#index', as:'index'
    end
  #Fin

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end