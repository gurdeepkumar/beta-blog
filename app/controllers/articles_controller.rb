class ArticlesController < ApplicationController

before_action :set_article, only: [:show, :edit, :update, :destroy]
  
#Create_block
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to articles_path
    else
      render 'new'
    end
    # render plain: params[:article]
  end

#Read_block
  def show
  end

  def index
    @articles = Article.all
  end

#Update_block
  def edit
  end

  def update
    #render plain: params
    if @article.update(article_params)
      flash[:notice] = "Updated successfully."
      redirect_to article_path(params[:id])
    else
      render 'edit'
    end
  end

#Deletion_block
  def destroy
    @article.destroy
    redirect_to articles_path
  end

#private_code
  private
  def set_article
    @article = Article.find(params[:id])  
  end
  
  def article_params
    params.require(:article).permit(:title, :description)    
  end

end
