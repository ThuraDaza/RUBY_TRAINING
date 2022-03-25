class ArticlesController < ApplicationController

  # download specific user's articles
  def export
    @user = UserService.get_user_by_id(params[:user_id])
    @articles = ArticleService.get_all_articles(@user)

    respond_to do |format|
      format.csv { send_data ArticleService.export_csv(@articles, ["title", "description", "public_flag"]), filename: "user's_articles.csv"}
    end

  end

  # create an article
  def create
    @user = UserService.get_user_by_id(params[:user_id])
    @article = ArticleService.create_article(@user, article_params)
    redirect_to user_path(@user)
  end

  # create articles using data from import csv file
  def import
    @user = UserService.get_user_by_id(params[:user_id])
    file = params[:file]

    if file
      # extracting data from csv and create articles
      ArticleService.import_article(@user, file)
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user), notice: "file must be uploaded"
    end
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
