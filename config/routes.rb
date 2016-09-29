Rails.application.routes.draw do
  post '/pr-event', to: 'pr_events#create'
  get '/leaderboard', to: 'pr_events#index'
end
