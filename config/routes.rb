Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
    	resources :articles
      # get 'articles/index'	
      # scope :format => true, :constraints => { :format => 'json' } do
        post   "/login"       => "sessions#create"
        delete "/logout"      => "sessions#destroy"
      # end
    end  
  end
end
