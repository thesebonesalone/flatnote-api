class NotesController < ApplicationController
  def show
    note = Note.find(params[:id])
    render :json => note
  end

  def create
    note = Note.new(note_params)
    note.save
    render :json => note
  end

  def destroy
    Note.destroy(params[:id])
    render :json => {message: "Success"}

  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    note.save
    render :json => note
  end

  private
    def note_params
      params.require(:note).permit(:user_id, :content, :title)
    end
end
