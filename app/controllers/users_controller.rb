class UsersController < ApplicationController

  def index
    @users = User.all.order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order("created_at DESC")
    @favorite_articles = @user.favorite_articles.order("created_at DESC")
    @stock_articles = @user.stock_articles.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end


end
