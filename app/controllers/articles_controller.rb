class ArticlesController < ApplicationController

#Create_block
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

#Update_block
  def edit
    @article = Article.find(params[:id])
  end

  def update
    #render plain: params
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Updated successfully."
      redirect_to article_path(params[:id])
    else
      render 'edit'
    end
  end

#Deletion_block
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

end
