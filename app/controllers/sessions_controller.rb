# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize
  # session[:user_id] = nil

  def new
    # session[:user_id] = nil
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user&.authenticate(params[:password])
      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to :welcome_index, flash: {success: "Successfully Logged in"}
      else
        flash.now[:info] = 'Please activate your account by following the
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, flash: {info: "Logged Out"}
  end
end
