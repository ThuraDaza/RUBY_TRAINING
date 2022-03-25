require 'logger'
class ArticleRepository
  class << self

    # select article using article id
    def get_article_by_id(user, id)
      @article = user.articles.find(id)
    end

    # create article
    def create_article(user, article)
        @is_save_post = user.articles.create(article)
    end

    # update article
    def update_article(article, article_params)
        @is_update_article = article.update(article_params)
    end

    # delete article
    def destroy_article(article)
      article.destroy
    end

  end
end