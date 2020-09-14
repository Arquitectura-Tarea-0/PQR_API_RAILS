# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :authorized
  before_action :set_request, only: [:create, :get_notes]

  def create
    par = notes_params
    par[:user_id] = @user.id
    @note = @request.notes.create(par)
    if @note.valid?
      render json: { note: @note, status: "ok"}
    else
      render json: { error: 'Invalid params' }
    end
  end

  def user_notes
    @notes = @user.notes.includes(:request)
    if @notes
      render json: { notes: @notes, status: "ok"}
    else
      render json: { error: "invalid params"}                  
    end
  end

  def get_notes
    @notes = @request.notes.includes(:request)           
        
    if @notes
      render json: { notes: @notes, status: "ok"}
    else
      render json: { error: "invalid params"}                  
    end
  end

  def get_note
    @note = Note.find(params[:id])
    render json: { note: @note, status: "ok"}
    
  end
  
  def set_request
    @request = Request.find(params[:id])
  end

  private

  def notes_params
    params.permit(:description)
  end
end
