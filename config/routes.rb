Rails.application.routes.draw do
  # get 'person/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'person#index'
  get '/search' => 'person#search'

  namespace 'api' do
    namespace 'v1' do
      resources :top_searched_npi, only: :index
    end
  end
end
