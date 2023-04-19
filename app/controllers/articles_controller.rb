class ArticlesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    articles = Article.all.includes(:user).order(created_at: :desc)
    render json: articles, each_serializer: ArticleListSerializer
  end



  def show
    article = Article.find(params[:id])
    render json: article
  end

  def page_views
    article = Article.find(params[:id])
    cookies[:views] ||= 0 
    cookies[:views] = cookies[:views].to_i + 1 
    session[:views] ||= 0
    session[:views] += 1 
  end 


  private

  def record_not_found
    render json: { error: "Article not found" }, status: :not_found
  end

end


# Our app will keep track of how many blog posts a user has viewed by using the session hash. Each user can view a maximum of three articles before seeing the paywall.

# Our app will keep track of how many blog posts a user has viewed by using the session hash. Each user can view a maximum of three articles before seeing the paywall.

# When a user makes a GET request to /articles/:id, the following should happen:

# If this is the first request this user has made, set session[:page_views] to an initial value of 0.
# Hint: consider using ||= to set this initial value!
# For every request to /articles/:id, increment the value of session[:page_views] by 1.
# If the user has viewed 3 or fewer pages, render a JSON response with the article data.
# If the user has viewed more than 3 pages, render a JSON response including an error message, and a status code of 401 unauthorized.