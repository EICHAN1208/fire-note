class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order("created_at DESC").page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order("created_at DESC").page(params[:page]).per(20)
    @favorite_articles = @user.favorite_articles.order("created_at DESC").page(params[:page]).per(20)
    @stock_articles = @user.stock_articles.order("created_at DESC").page(params[:page]).per(20)
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
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @users = user.followings.page(params[:page]).per(200)
  end

  def followers
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @users = user.followers.page(params[:page]).per(200)
  end


end
