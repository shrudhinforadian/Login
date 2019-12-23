# frozen_string_literal: true

class ArticlesController < ApplicationController


before_action :authorize
  def index
    @user = User.find(session[:user_id])
    @articles = @user.articles.all
  end

  def show
    @user = User.find(session[:user_id])
    @article = @user.articles.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    @article = @user.articles.new
  end

  def edit
    @user = User.find(session[:user_id])
    @article = @user.articles.find_by(params[:id])
  end

  def create
    @user = User.find(session[:user_id])
    @article = @user.articles.create(article_params)
    # @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @user = User.find(session[:user_id])
    @article = @user.articles.find_by(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @article = @user.articles.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text ,:user_id)
  end
end
