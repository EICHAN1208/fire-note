class StocksController < ApplicationController
  def create
    @article = Article.find(params[:article_id]) #create.js.erbで必要
    stock = current_user.stocks.build(article_id: params[:article_id])
    stock.save
    # redirect_to article_path(stock.article_id)
  end

  def destroy
    @article = Article.find(params[:article_id]) #destroy.js.erbで必要
    stock = Stock.find_by(article_id: params[:article_id], user_id: current_user.id)
    stock.destroy
    # redirect_to article_path(stock.article_id)
  end
end
