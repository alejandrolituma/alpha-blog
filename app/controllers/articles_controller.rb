class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy] 
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    #debugger | ctrl+d to exit debugger
    @article = Article.new(article_params)
    @article.user = User.first
    #@article.save
    #redirect_to article_path(@article)
    #What if validation does not pass, we need to take that into consideration
    if @article.save
      #do something
      flash[:success] = "Article was succesfully created"
      redirect_to article_path(@article)
    else
      #validation failed
      render 'new'
    end
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  def update
    
    if @article.update(article_params)
      flash[:success] = "Article was succesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    
    @article.destroy
    flash[:danger] = "Article was succesfully deleted"
    redirect_to articles_path
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title,:description)
    end
    
end
