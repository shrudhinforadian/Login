# frozen_string_literal: true

class ArticlesController < ApplicationController

  before_action :authorize
  def index
    @articles = @current_user.articles.all
  end

  def show
    @article = @current_user.articles.find(params[:id])
  end

  def new
    @article = @current_user.articles.new
  end

  def edit
    @article = @current_user.articles.find_by(params[:id])
  end

  def create
    @article = @current_user.articles.create(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = @current_user.articles.find_by(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = @current_user.articles.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
end
