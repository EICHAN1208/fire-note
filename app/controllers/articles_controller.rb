class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to article_path, notice: "記事を投稿しました！"
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
      params.require(:article).permit(:title, :type, :summary, :content, :good_point, :problem, :try)
    end
end
