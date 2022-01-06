class ArticlesController < ApplicationController

   # create an article
   def create
    @user = UserService.getUserByID(params[:user_id])
    @article = ArticleService.createArticle(@user, article_params)
    redirect_to user_path(@user)
  end

  def edit
    @user = UserService.getUserByID(params[:user_id])
    @article = ArticleService.getArticleByID(@user, params[:id])
  end

  def update
    @user = UserService.getUserByID(params[:user_id])
    @article = ArticleService.getArticleByID(@user, params[:id])
    ArticleService.updateArticle(@article, article_params)

    redirect_to user_path(@user)
  end

  def destroy
    @user = UserService.getUserByID(params[:user_id])
    @article = ArticleService.getArticleByID(@user, params[:id])
    ArticleService.destroyArticle(@article)
    redirect_to user_path(@user)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description, :public_flag)
    end
    
end
