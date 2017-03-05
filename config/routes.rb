Rails.application.routes.draw do
  #Home Routes
  root 'home#login'
  get '/home/load_partial', to: 'home#load_partial', :as => 'load_home_partial'
  get '/index', to: 'home#index', :as => 'index'

  #Admin Routes
  get '/admin/load_partial', to: 'admin#load_partial', :as => 'load_admin_partial'
  get '/admin/:id/edit', to: 'admin#edit', :as => 'admin_edit'
  patch '/admin/:id/update', to: 'admin#update', :as => 'admin_update'

  post '/login' => 'admin#login', :as => :admin_login
    controller :admin do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  #API Routes
  get '/articles_init/:locale' => 'api#articles_init'
  get '/events_init/:locale' => 'api#events_init'
  get '/products_init/:locale' => 'api#products_init'
  #get '/test_init/:locale' => 'api#test_init'

  #Article Routes
  get '/articles/load_partial', to: 'articles#load_partial', :as => 'load_article_partial'
  get '/articles/new', to: 'articles#new', :as => 'article_new'
  post '/articles/create', to: 'articles#create', :as => 'article_create'
  get '/articles/:id/destroy', to: 'articles#destroy',:as => 'article_destroy'
  get '/articles/:id/edit', to: 'articles#edit', :as => 'article_edit'
  patch '/articles/:id/update', to: 'articles#update', :as => 'article_update'

  #Events Routes
  get '/events/load_partial', to: 'events#load_partial', :as => 'load_event_partial'
  get '/events/new', to: 'events#new', :as => 'event_new'
  post '/events/create', to: 'events#create', :as => 'event_create'
  get '/events/:id/destroy', to: 'events#destroy',:as => 'event_destroy'
  get '/events/:id/edit', to: 'events#edit', :as => 'event_edit'
  patch '/events/:id/update', to: 'events#update', :as => 'event_update'

  #Products Routes
  get '/products/load_partial', to: 'products#load_partial', :as => 'load_product_partial'
  get '/products/new', to: 'products#new', :as => 'product_new'
  post '/products/create', to: 'products#create', :as => 'product_create'
  get '/products/:id/destroy', to: 'products#destroy',:as => 'product_destroy'
  get '/products/:id/edit', to: 'products#edit', :as => 'product_edit'
  patch '/products/:id/update', to: 'products#update', :as => 'product_update'
  put 'products/sort', to: 'products#sort', :as => 'products_sort'

  #Wines Routes
  get '/wines/load_partial', to: 'wines#load_partial', :as => 'load_wine_partial'
  get '/wines/new', to: 'wines#new', :as => 'wine_new'
  post '/wines/create', to: 'wines#create', :as => 'wine_create'
  get '/wines/:id/destroy', to: 'wines#destroy',:as => 'wine_destroy'
  get '/wines/:id/edit', to: 'wines#edit', :as => 'wine_edit'
  patch '/wines/:id/update', to: 'wines#update', :as => 'wine_update'
  put 'wines/sort', to: 'wines#sort', :as => 'wines_sort'

  #Services Routes
  get '/services/load_partial', to: 'services#load_partial', :as => 'load_service_partial'
  get '/services/new', to: 'services#new', :as => 'service_new'
  post '/services/create', to: 'services#create', :as => 'service_create'
  get '/services/:id/destroy', to: 'services#destroy',:as => 'service_destroy'
  get '/services/:id/edit', to: 'services#edit', :as => 'service_edit'
  patch '/services/:id/update', to: 'services#update', :as => 'service_update'
  put 'services/sort', to: 'services#sort', :as => 'services_sort'

  #Notifications Routes
  get '/notifications/load_partial', to: 'notifications#load_partial', :as => 'load_notification_partial'
  get '/notifications/new', to: 'notifications#new', :as => 'notification_new'
  post '/notifications/create', to: 'notifications#create', :as => 'notification_create'
  get '/notifications/:id/destroy', to: 'notifications#destroy',:as => 'notification_destroy'
  get '/notifications/:id/edit', to: 'notifications#edit', :as => 'notification_edit'
  patch '/notifications/:id/update', to: 'notifications#update', :as => 'notification_update'

end
