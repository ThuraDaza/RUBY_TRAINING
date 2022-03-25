class ArticleMailer < ApplicationMailer
  def send_articles
    @current_user = params[:current_user]
    @articles = @current_user.articles
    mail to: @current_user.email
  end
end
