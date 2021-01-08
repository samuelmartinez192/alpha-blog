class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #@article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    #@article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      # Hay dos helpers que ayudan a mostrar mensajes en rails
      # flash o alert, alter se muestra cuando ocurren erroes por lo regular
      flash[:notice] = "Article was created sucessfully."
      # redirect_to article_path(@article)
      # Shortcut para el article_path, ejecutan la misma accion
      redirect_to @article
    else
      render "new"
    end
  end

  def update
    #@article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Article was updated sucessfully."
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end