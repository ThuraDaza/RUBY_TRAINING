class ArticleService
  class << self

    # select all articles
    def get_all_articles(user)
      @articles = ArticleRepository.get_all_articles(user)
    end

    # select article using article id
    def get_article_by_id(user, id)
      @article = ArticleRepository.get_article_by_id(user, id)
    end

    # import articles from csv file
    def import_article(user, file)
      @rowarraydisp = CSV.read(file.path).drop(1)
    
      @rowarraydisp.each do |article|
        temp_params = {"title"=>article[0], "description"=>article[1], "public_flag"=>article[2]}
        createArticle(user, temp_params)
      end
    end

    def export_csv(articles, fields = column_names, options = {})
      CSV.generate(options) do |csv|
        csv << fields
        articles.each do |article|
          csv << article.attributes.values_at(*fields)
        end
      end
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