class ArticlesController < ApplicationController

  # create an article
  def create
    @user = User.find(params[:user_id])
    @article = @user.articles.create(article_params)
    redirect_to user_path(@user)
  end

  private
    def article_params
      params.require(:article).permit(:title, :description, :public_flag)
    end

end
