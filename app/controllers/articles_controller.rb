# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit]
  before_action :find_article_by_user, only: [:update, :destroy]
  #fetching all articles of current user
  def index
    @articles = @current_user.articles.all
    @articles = @articles.order(created_at: :desc)
  end
  #displaying selected article
  def show

  end
  #creating new article object
  def new
    @article = @current_user.articles.build
  end
  #edits article
  def edit

  end
  #creating new article with params
  def create
    @article = @current_user.articles.build(article_params)
    if @article.save

      redirect_to @article, flash: { success: 'Blog Successfully Inserted' }

    else
      flash.now[:warning] = 'Blog Insertion Failed!'
      render 'new'
    end
  end
  #Updating article
  def update
    if @article.update(article_params)
      redirect_to @article, flash: { success: 'Blog Successfully Updated' }
    else
      flash.now[:warning] = 'Blog Updation Failed'
      render 'edit'
    end
  end
  #deleting selected article
  def destroy
    @article.destroy
    if @article.destroy
      redirect_to articles_path, flash: { success: 'Blog Successfully Deleted' }
    else
      flash.now[:success] = 'Blog Deletion Failed'
      render 'show'
    end
  end

  private
  #finding the article which is in the current users ownership
  def find_article_by_user
    @article = @current_user.articles.find(params[:id])
  end
  #finding all article
  def find_article
    @article = Article.find_by_id(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end
end
