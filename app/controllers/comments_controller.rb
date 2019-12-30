# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :searcharticle
  before_action :searchcomment, only: [:show, :destroy]
  #creating new comment
  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      flash[:success] = 'Comment inserted Successfully'
      redirect_to article_path(@article)
    else
      flash[:warning] = 'Cannot insert a blank comment'
      redirect_to article_path(@article)
    end
  end
  #destroys selected comment
  def destroy
    if @comment.destroy
      redirect_to article_path(@article), flash: { info: 'Comment Deleted Successfully' }
    else
      redirect_to article_path(@article), flash: { danger: 'Cannot Delete the comment' }
    end
  end
  #showing comment
  def show
    redirect_to article_path(@article)
  end

  private
  #finding all comments related to the article
  def searchcomment
    @comment = @article.comments.find_by_id(params[:id])
  end
  #searching articles
  def searcharticle
    @article = Article.find_by_id(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
