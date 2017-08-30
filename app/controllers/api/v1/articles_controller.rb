class ArticlesController < ApiController
  before_action :require_login
  
  # This is protected by API token
  def index
    render json: { articles: 'index articulos'}
  end
end