# frozen_string_literal: true

class WelcomeController < ApplicationController
  # skip_before_action :authorize
  def index
    @articles = Article.all
    @articles = @articles.order(created_at: :desc)
    @users = User.all
   end

  # frozen_string_literal: true
  # def show
  #   @article = Article.find_by(params[:id])
  #  end
end
