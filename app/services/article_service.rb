class ArticleService
    def find(id)
        begin
            article = Article.find(id)
        rescue => e
            return { success: false }
        end

        return { success: true, article: article }
    end

    def create(params)
        article = Article.new(params)

        if article.save 
            return { success: true, article: article }
        else
            return { success: false, errors: article.errors }
        end
    end

    def update(id, params)
        begin
            article = Article.find(id)
        rescue => e
            return { success: false }
        end

        if article.update(params)
            return { success: true, article: article }
        else
            return { success: false, errors: article.errors }
        end
    end

    def destroy(id)
        begin
            article = Article.find(id)
        rescue => e
            return { success: false }
        end

        if article.destroy
            return { success: true }
        else
            return { success: false, errors: article.errors }
        end
    end
end
