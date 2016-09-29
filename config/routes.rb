Rails.application.routes.draw do
  post '/pr-event', to: 'pr_events#create'
  get '/pr-event', to: 'pr_events#index'
end
