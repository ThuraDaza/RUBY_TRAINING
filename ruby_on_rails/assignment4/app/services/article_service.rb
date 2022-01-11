class ArticleService
  class << self

    # select article using article id
    def getArticleByID(user, id)
      @article = ArticleRepository.getArticleByID(user, id)
    end
    
    # create article
    def createArticle(user, article)
        @is_save_post = ArticleRepository.createArticle(user, article)
    end

    # update article
    def updateArticle(article, article_params)
        @is_update_article = ArticleRepository.updateArticle(article, article_params)
    end

    # delete article
    def destroyArticle(article)
        ArticleRepository.destroyArticle(article)
    end

  end    
end