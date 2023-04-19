Rails.application.routes.draw do
  # resources :articles, only: [:index, :show]
  get '/articles', to: 'articles#index'
  
  get '/articles/:id', to: 'sessions#page_views'
end


# in React, Article.js component, get request to `/articles/${id}`
# in routes, added a route called '/articles/:id' that goes to my sessions controller and hits action called page_views.
