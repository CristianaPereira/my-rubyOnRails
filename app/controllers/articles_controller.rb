class ArticlesController < ApplicationController
  def show
    @id = params[:id]
    @article = Article.find(@id)
  end

  def index
    @articles = Article.all
  end

  def new
    # initializes @article when entering form page
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully."

      # redirect_to article_path(@article)
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
  end
end
