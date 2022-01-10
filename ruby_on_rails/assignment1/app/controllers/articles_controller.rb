class ArticlesController < ApplicationController

  # download specific user's articles
  def export
    @user = UserService.getUserByID(params[:user_id])
    @articles = ArticleService.getAllArticles(@user)

    respond_to do |format|
      format.csv { send_data ArticleService.exportCsv(@articles, ["title", "description", "public_flag"]), filename: "user's_articles.csv"}
    end

  end

  # create an article
  def create
    @user = UserService.getUserByID(params[:user_id])
    @article = ArticleService.createArticle(@user, article_params)
    redirect_to user_path(@user)
  end

  # create articles using data from import csv file
  def import
    @user = UserService.getUserByID(params[:user_id])
    file = params[:file]

    # extracting data from csv and create articles
    ArticleService.importArticle(@user, file)
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
