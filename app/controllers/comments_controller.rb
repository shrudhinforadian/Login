# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :seararticle

  def create
    @comment = @article.comments.create(comment_params)
    if @comment.save
      flash[:success] = 'Comment inserted Successfully'
      redirect_to article_path(@article)
    else
      flash[:warning] = 'Cannot insert a blank comment'
      redirect_to article_path(@article)
    end
  end

  def destroy
    searchcomment
    if @comment.destroy

      redirect_to article_path(@article) , flash: {info: 'Comment Deleted Successfully'}
    else

      redirect_to article_path(@article), flash: {danger: 'Cannot Delete the comment'}
    end
  end

  def show
    searchcomment
    if @comment.destroy

      redirect_to article_path(@article), flash: {info: 'Comment Deleted Successfully'}
    else

      redirect_to article_path(@article), flash:{danger: 'Cannot Delete the comment'}
    end
end

  private

  def searchcomment
    @comment = @article.comments.find_by(params[:id])
  end

  def seararticle
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
