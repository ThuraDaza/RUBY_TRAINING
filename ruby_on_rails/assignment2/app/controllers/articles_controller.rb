class ArticlesController < ApplicationController

   # create an article
   def create
    @user = UserService.get_user_by_id(params[:user_id])
    @article = ArticleService.create_article(@user, article_params)
    redirect_to user_path(@user)
  end

  def edit
    @user = UserService.get_user_by_id(params[:user_id])
    @article = ArticleService.get_article_by_id(@user, params[:id])
  end

  def update
    @user = UserService.get_user_by_id(params[:user_id])
    @article = ArticleService.get_article_by_id(@user, params[:id])
    ArticleService.update_article(@article, article_params)

    redirect_to user_path(@user)
  end

  def destroy
    @user = UserService.get_user_by_id(params[:user_id])
    @article = ArticleService.get_article_by_id(@user, params[:id])
    ArticleService.destroy_article(@article)
    redirect_to user_path(@user)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description, :public_flag)
    end
    
end
