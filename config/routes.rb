Rails.application.routes.draw do
  # get 'hacker_spots/index'
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      scope :format => true, :constraints => { :format => 'json' } do
        post   "/login"       => "sessions#create"
        delete "/logout"      => "sessions#destroy"
      end
   end
end
