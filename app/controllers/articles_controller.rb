class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article sauvegardé !"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Erreur, réessayez."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    @article.update(article_params)

    if @article.save
      flash[:notice] = "Article sauvegardé !"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Erreur, réessayez."
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(
      :title,
      :html_content,
      :delta_content,
      :user_id
    )
  end
end
