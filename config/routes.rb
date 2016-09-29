Rails.application.routes.draw do
  match '/pr-event', to: 'pr_events#create'
  get '/pr-event', to: 'pr_events#index'
end
