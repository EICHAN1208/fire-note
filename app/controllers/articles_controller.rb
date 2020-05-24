class ArticlesController < ApplicationController
  before_action :sign_in_required, only: [:index]
  before_action :authenticate_user!

  def timeline
    if user_signed_in?
      @feed_items = current_user.feed.order("created_at DESC").page(params[:page]).per(20)
    end
  end

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).order("created_at DESC").page(params[:page]).per(20)
    @all_ranks = Article.where(id: Favorite.group(:article_id).order(Arel.sql('count(article_id) desc')).pluck(:article_id)).page(params[:page]).per(20)
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "記事を投稿しました！"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "記事を更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy!
      redirect_to articles_path, notice: "記事を削除しました！"
    else
      render :show
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :kind, :summary, :content, :good_point, :problem, :challenge)
    end
end
