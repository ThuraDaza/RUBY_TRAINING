require 'logger'
class ArticleRepository
  class << self

    # select article using article id
    def getArticleByID(user, id)
      @article = user.articles.find(id)
    end

    # create article
    def createArticle(user, article)
        @is_save_post = user.articles.create(article)
    end

    # update article
    def updateArticle(article, article_params)
        @is_update_article = article.update(article_params)
    end

    # delete article
    def destroyArticle(article)
      article.destroy
    end

  end
end