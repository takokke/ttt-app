Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'homes#top'
  get '/about' => 'homes#about'
  get '/search' => 'searches#search_result'
  resources :ideas, only: [:index]
end
