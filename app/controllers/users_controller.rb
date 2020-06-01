class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show stocks favoites edit follows followers]

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @articles = @user.articles.order("created_at DESC").page(params[:page]).per(20)
    # @favorite_articles = @user.favorite_articles.order("created_at DESC").page(params[:page]).per(20)
    # @stock_articles = @user.stock_articles.order("created_at DESC").page(params[:page]).per(20)
  end

  def stocks
    @articles = @user.articles.order("created_at DESC").page(params[:page]).per(20)
    @stock_articles = @user.stock_articles.order("created_at DESC").page(params[:page]).per(20)
  end

  def favorites
    @articles = @user.articles.order("created_at DESC").page(params[:page]).per(20)
    @favorite_articles = @user.favorite_articles.order("created_at DESC").page(params[:page]).per(20)
  end

  def edit; end

  def update
    if @user.update
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def follows
    @users = @user.followings.page(params[:page]).per(200)
  end

  def followers
    @users = @user.followers.page(params[:page]).per(200)
  end


  private

  def set_user
    @user = User.find(params[:id])
  end
end
