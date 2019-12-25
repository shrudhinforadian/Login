# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :authorize
  def create
          @user = User.new(user_params)
        if @user.save
          UserMailer.registration_confirmation(@user).deliver
          flash[:success] = "Please confirm your email address to continue"
          redirect_to root_url
        else
          flash[:error] = "Ooooppss, something went wrong!"
          render 'new'
        end
    end
  def new
    @user = User.new
  end
  def confirm_email
      user = User.find_by_confirm_token(params[:id])
      if user
        p user
        user.email_activate
        flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
        Please sign in to continue."
        redirect_to login_url
      else
        flash[:error] = "Sorry. User does not exist"
        redirect_to root_url
      end
  end

  # def create
  #   @user = User.new(user_params)
  #
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to '/welcome', notice: 'Thank you for signing up!'
  #   else
  #     render 'new', notice: 'Signing failed'
  #   end
  # end
  #
  # private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
