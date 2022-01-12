class ArticleService
  class << self

    # select article using article id
    def get_article_by_id(user, id)
      @article = ArticleRepository.get_article_by_id(user, id)
    end
    
    # create article
    def create_article(user, article)
        @is_save_post = ArticleRepository.create_article(user, article)
    end

    # update article
    def update_article(article, article_params)
        @is_update_article = ArticleRepository.update_article(article, article_params)
    end

    # delete article
    def destroy_article(article)
        ArticleRepository.destroy_article(article)
    end

  end    
end