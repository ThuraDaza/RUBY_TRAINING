class ArticleService
  class << self

    # select all articles
    def getAllArticles(user)
      @articles = ArticleRepository.getAllArticles(user)
    end

    # select article using article id
    def getArticleByID(user, id)
      @article = ArticleRepository.getArticleByID(user, id)
    end

    # import articles from csv file
    def importArticle(user, file)
      @rowarraydisp = CSV.read(file.path).drop(1)
    
      @rowarraydisp.each do |article|
        temp_params = {"title"=>article[0], "description"=>article[1], "public_flag"=>article[2]}
        createArticle(user, temp_params)
      end
    end

    def exportCsv(articles, fields = column_names, options = {})
      CSV.generate(options) do |csv|
        csv << fields
        articles.each do |article|
          csv << article.attributes.values_at(*fields)
        end
      end
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