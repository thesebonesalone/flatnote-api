class NotesController < ApplicationController
  def show
    note = Note.find(params[:id])
    render :json => note
  end

  def create
    note = Note.new(note_params)
    if note.save
      render :json => {note: note, message: "Success"}
    else
      render :json => {message: "Unable to create note. Please fill out all fields"}
    end
  end

  def destroy
    Note.destroy(params[:id])
    render :json => {message: "Success"}

  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    if note.save
      render :json => {note: note, message: "Success"}
    else
      render :json => {message: "Unable to save note. Please fill out all fields."}
    end
  end

  private
    def note_params
      params.require(:note).permit(:user_id, :content, :title)
    end
end
