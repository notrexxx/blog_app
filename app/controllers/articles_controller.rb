class ArticlesController < ApplicationController
    def new
      @article = Article.new
     end
     def create
        @article = Article.new(article_params)
        if @article.save
         flash[:notice] = "Article was successfully created"
         redirect_to article_path(@article)
        else
         render 'new'
        end
       end
    private
      def article_params
       params.require(:article).permit(:title, :description)
      end

      def show
        
        @article = Article.find(params[:id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
    end