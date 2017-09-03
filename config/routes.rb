Rails.application.routes.draw do
	root "users#index"
  namespace :api, defaults: {format: :json} do
		namespace :v1 do
			resources :articles
		  resources :movements
		  get "total_articles/:id" => "articles#total_articles"
		  post   "/login"  => "sessions#create"
		  delete "/logout" => "sessions#destroy"
		end  
  end

	resources :users
	resources :articles_admin
end
