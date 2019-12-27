# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = @current_user.articles.all
    @articles = @articles.order(created_at: :desc)
  end

  def show
    find_article
  end

  def new
    @article = @current_user.articles.new
  end

  def edit
    find_article
  end

  def create
    find_article_by_user
    if @article.save

      redirect_to @article ,flash:{success: 'Blog Successfully Inserted'}

    else
      flash.now[:warning] = 'Blog Insertion Failed!'
      render 'new'
    end
  end

  def update
    find_article_by_user

    if @article.update(article_params)

      redirect_to @article,flash:{success:'Blog Successfully Updated'}

    else
      flash.now[:warning] = 'Blog Updation Failed'
      render 'edit'
    end
  end

  def destroy
    find_article_by_user
    @article.destroy
    if @article.destroy

      redirect_to articles_path ,flash:{success: 'Blog Successfully Deleted'}

    else
      flash.now[:success] = 'Blog Deletion Failed'
      render 'show'
    end
  end

  private
  def find_article_by_user
    @article = @current_user.articles.find(params[:id])
  end
  def find_article
    @article = Article.find_by_id(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
end
