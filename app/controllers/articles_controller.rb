class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    #@article.save
    #redirect_to article_path(@article)
    #What if validation does not pass, we need to take that into consideration
    if @article.save
      #do something
      flash[:notice] = "Article was succesfully created"
      redirect_to article_path(@article)
    else
      #validation failed
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title,:description)
    end
    
end
