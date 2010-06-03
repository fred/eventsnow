ActionController::Routing::Routes.draw do |map|
  map.resources :messages

  map.resources :pages

  map.resources :events

  map.root :controller => "events"
  
  map.resource :account, :controller => "users"
  map.resources :users
  map.resources :messages
  map.resource :user_session
  
  map.user "/user/:login",  :controller => "users", :action => "user", :user => :user
  
  map.login    "login",     :controller => "user_sessions", :action => "new"
  map.signin   "signin",    :controller => "user_sessions", :action => "new"
  map.logout   "logout",    :controller => "user_sessions", :action => "destroy"
  map.signup   "signup",    :controller => "users", :action => "new"
  map.register "register",  :controller => "users", :action => "new"
  map.contact  "contact",   :controller => "messages", :action => "new"
  
  # Admin home page
  map.admin "/admin", :controller => "admin/dashboard"
  # Admin dashboard
  map.connect '/dashboard/:action', :controller => "admin/dashboard"
  # Admin routes
  map.namespace :admin do |admin|
    admin.resources :settings
    admin.resources :users
    admin.resources :events, :belongs_to => "author"
    admin.resources :messages
  end
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
