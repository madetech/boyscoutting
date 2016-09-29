Rails.application.routes.draw do
  match '/pr-event', to: 'pr_events#create'
end
