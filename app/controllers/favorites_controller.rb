class FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id]) #create.js.erbで必要
    favorite = current_user.favorites.build(article_id: params[:article_id])
    favorite.save
    # redirect_to article_path(favorite.article_id)
  end

  def destroy
    @article = Article.find(params[:article_id]) #create.js.erbで必要
    favorite = Favorite.find_by(article_id: params[:article_id], user_id: current_user.id)
    favorite.destroy!
    # redirect_to article_path(favorite.article_id)
  end
end
