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
    params = params.delete_if {|key, value| value.blank?}
    unless params.blank?
      @requests = Request.where(params)            
    else
      @requests = Request.all
    end

    if @requests
      render json: { request: @requests, status: "ok"}
    else
      render json: { error: "invalid params"}                  
    end
  end

  def user_requests    
    params = params.delete_if {|key, value| value.blank?}
    unless params.blank?
      @requests = @user.requests.where(params)            
    else
      @requests = @user.requests
    end

    if @requests
      render json: { request: @requests, status: "ok"}
    else
      render json: { error: "invalid params"}                  
    end    
  end

  private

  def requests_params
    params.permit(:request_type, :subject, :description)
  end
end
