# frozen_string_literal: true

class WelcomeController < ApplicationController

  #showing all articles
  def index
    @articles = Article.all
    @articles = @articles.order(created_at: :desc)
    @users = User.all
   end

end
