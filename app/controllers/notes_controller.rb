class NotesController < ApplicationController
  before_action :require_login

  def create
    user = current_user
    track = Track.find(params[:track_id])
    note = Note.new
    note.track_id = track.id
    note.user_id = user.id
    note.comment = params[:note][:comment]
    note.save
    redirect_to track_url(track)
  end

  def destroy
    note = Note.find(params[:id])
    unless note.user_id == current_user.id || current_user.is_admin?

      redirect_to track_url(params[:track_id])
    end
    note.destroy!
    redirect_to track_url(params[:track_id])
  end


end
