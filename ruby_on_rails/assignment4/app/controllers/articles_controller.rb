class ArticlesController < ApplicationController

  def send_email
    @current_user = current_user
    ArticleMailer.with(current_user: @current_user).send_articles.deliver_now
  end

  def new
    @article = Article.new
  end

  def create
    @current_user = current_user
    @article = ArticleService.create_article(@current_user, article_params)
    
    if @article.save
      redirect_to user_path(@current_user)
    else
      render :new
    end

  end

  def edit
    @article = ArticleService.get_article_by_id(current_user, params[:id])
  end

  def update
    @current_user = current_user
    @article = ArticleService.get_article_by_id(@current_user, params[:id])
    ArticleService.update_article(@article, article_params)

    redirect_to user_path(@current_user)
  end

  def destroy
    @current_user = current_user
    @article = ArticleService.get_article_by_id(@current_user, params[:id])
    ArticleService.destroy_article(@article)
    
    redirect_to user_path(@current_user)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description, :public_flag)
    end
    
end
