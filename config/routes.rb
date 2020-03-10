Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'requests#index'
    get '/requests/all' => 'requests#all', as: 'all_request'
    get '/requests/new' => 'requests#new', as: 'new_request'
    post '/requests' => 'requests#create'
    get '/requests/:id' => 'requests#show', as: 'request'
    get '/requests/:id/edit' => 'requests#edit', as: 'edit_request'
    patch '/requests/:id' => 'requests#update'
    delete 'requests/:id' => 'requests#destroy'
    post 'requests/:id' => 'requests#join'
    delete 'requests/:id/unjoin' => 'requests#unjoin'
    get '/accepted' => 'requests#accepted'
    get '/created' => 'requests#created'

    get '/appointments/all' => 'appointments#all', as: 'all_appointment'
    get '/appointments/new' => 'appointments#new', as: 'new_appointment'
    post '/appointments' => 'appointments#create'
    get '/appointments/:id' => 'appointments#show', as: 'appointment'
    get '/appointments/:id/edit' => 'appointments#edit', as: 'edit_appointment'
    patch '/appointments/:id' => 'appointments#update'
    delete 'appointments/:id' => 'appointments#destroy'
    post 'appointments/:id' => 'appointments#join'
    delete 'appointments/:id/unjoin' => 'appointments#unjoin'
end