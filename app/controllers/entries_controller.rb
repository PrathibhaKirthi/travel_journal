class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: %i[ show edit update destroy ]

  def index
    @entries = current_user.entries

    if params[:query].present?
      @entries = @entries.where(
        "title ILIKE ? OR content ILIKE ?",
        "%#{params[:query]}%",
        "%#{params[:query]}%"
      )
    end
  end

  def show
  end

  def new
    @entry = current_user.entries.new
  end

  def edit
  end

  def create
    @entry = current_user.entries.new(entry_params)

    if @entry.save
      redirect_to @entry, notice: "Entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to @entry, notice: "Entry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path, notice: "Entry was successfully deleted."
  end

  private

  def set_entry
    @entry = current_user.entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :content, :image)
  end
end
