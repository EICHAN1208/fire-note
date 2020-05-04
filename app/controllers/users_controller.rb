class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order("created_at DESC")
    @favorite_articles = @user.favorite_articles
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end


end
