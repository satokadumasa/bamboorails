class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.all
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.where(user_id: bookmark_params[:user_id]).where(note_id: bookmark_params[:note_id]).first
    if @bookmark
      @bookmark.destroy
      render json: {'status': 'remove'}
    else
      @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
        render json: {'status': 'success'}
      else
        render json: {'status': 'error'}
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    if @bookmark.destroy
      render json: {'status': 'remove'}
    else
      render json: {'status': 'error'}
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    if @bookmark.destroy
      render json: {'status': 'remove' }
    else
      render json: {'status': 'error' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:user_id, :note_id)
    end
end
