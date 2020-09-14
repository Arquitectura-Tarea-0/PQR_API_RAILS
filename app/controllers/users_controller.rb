# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorized, only: %i[auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token(user_id: @user.id)
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid email or password' }
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = encode_token(user_id: @user.id)
      render json: { user: @user, token: token }
    else
      render json: { error: 'Invalid email or password' }
    end
  end

  def auto_login
    render json: @user
  end

  def get_user
    @user = User.find(params[:id])
    render json: { user: @user}
  end

  def get_users
    if search_params.blank?
      @users = User.includes(:requests).all           
    else
      @users = User.includes(:requests).where(search_params)
    end
    if @users
      render json: { users: @users, status: "ok"}
    else
      render json: { error: "invalid params"}                  
    end
  end

  private


  def search_params
    params.permit(:name, :password_digest, :role, :email).delete_if {|key, value| value.blank?}
  end

  def user_params
    params.permit(:name, :password, :email)
  end
end
