class RelatedNotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_related_note, only: %i[ edit update destroy ]
  before_action :set_note, only: %i[ edit update destroy ]

  def create
    @note = Note.find(params[:note_id])

    @note.related_notes.create!(related_note_params.merge(user: current_user))

    redirect_to @note
  end

  def edit

  end

  def update
    if @related_note.update(related_note_params)
      redirect_to @note, notice: "Related Note Has Been Updated"
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @related_note.destroy!

    redirect_to @note, notice: "Related Note Successfully Deleted"
  end

  private

  def set_note
    @note = current_user.notes.find(params[:note_id])
  end

  def set_related_note
    @related_note = current_user.related_notes.find(params[:id])
  end

  def related_note_params
    params.expect(related_note: [ :content, :user_id ])
  end
end
