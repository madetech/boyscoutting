Rails.application.routes.draw do
  post '/pr-event', to: 'pr_events#create'
end
