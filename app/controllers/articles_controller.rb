class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).order(created_at: :desc)
  end

  def show
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to articles_path, notice: "記事を投稿しました！"
    else
      render :new
    end
  end

  def edit
  end

  private
    def article_params
      params.require(:article).permit(:title, :type, :summary, :content, :good_point, :problem, :try)
    end
end
