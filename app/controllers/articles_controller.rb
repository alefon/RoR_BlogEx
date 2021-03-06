class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if  @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  # GET /rubros/1
  def show
  end
  # GET /rubros/1/edit
  def edit
  end
  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end

=begin
    @article = Article.find(params[:id])

    if @article.update(article_params)


      redirect_to @article
    else
      render 'edit'
    end
=end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
