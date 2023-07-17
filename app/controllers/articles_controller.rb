class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "The Article is successfully posted"
      redirect_to articles_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])
    if @article.update(article_params)
      flash[:notice] = "The Article is successfully updated"
      redirect_to articles_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

private

  def article_params
    params.require(:article).permit(:title, :content)
  end


end
