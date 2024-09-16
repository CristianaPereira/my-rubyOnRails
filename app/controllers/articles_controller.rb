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
end
