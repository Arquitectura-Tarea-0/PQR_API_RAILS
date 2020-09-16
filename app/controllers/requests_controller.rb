# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :authorized
  def create
    @request = @user.requests.create(requests_params)
    if @request.valid?
      render json: { request: @request, status: "ok"}
    else
      render json: { error: 'Invalid params' }
    end
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(requests_params)
      render json: { request: @request, status: "ok"}
    else 
      render json: { error: 'Invalid params' }
    end
  end

  def general_requests
    if search_params.blank?
      @requests = Request.includes(:user).all           
    else
      @requests = Request.includes(:user).where(search_params)
    end
    if @requests
      render json: { request: @requests, status: "ok"}
    else
      render json: { error: "invalid params"}
    end
  end

  def user_requests        
    if search_params.blank?
      @requests = @user.requests.to_json(include: :user)                  
    else
      @requests = @user.requests.where(search_params).to_json(include: :user)
    end

    if @requests
      render json: { request: JSON.parse(@requests), status: "ok"}
    else
      render json: { error: "invalid params"}                  
    end    
  end

  def get_request
    @request = Request.find(params[:id]).to_json(include: :notes)
    render json: { request: JSON.parse(@request) }
  end

  private

  def search_params
    params.permit(:request_type, :request_state, :subject, :description, :user_id).delete_if {|key, value| value.blank?}
  end

  def requests_params
    params.permit(:request_type, :request_state, :subject, :description)
  end
end
