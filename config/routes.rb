Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'jobs/index'
      post 'jobs/create'
      get '/show/:id', to: 'jobs#show'
      delete '/destroy/:id', to: 'jobs#destroy'

      get 'jobseekers/index'
      post 'jobseekers/create'
      get '/show/:id', to: 'jobseekers#show'
      delete '/destroy/:id', to: 'jobseekers#destroy'
    end
  end
  root 'homepage#index'
  get '/*path' => 'homepage#index'
end
