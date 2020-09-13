# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end

  def auth_header
    # { Authorization: '<token>' }
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    # header: { 'Authorization': '<token>' }
    begin
      JWT.decode(auth_header, 's3cr3t', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    return if logged_in?
    
    render json: { message: 'Please log in' }, status: :unauthorized
  end
end
