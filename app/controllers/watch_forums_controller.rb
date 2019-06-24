class WatchForumsController < ApplicationController
  before_action :set_watch_forum, only: [:show, :edit, :update, :destroy]

  # GET /watch_forums
  # GET /watch_forums.json
  def index
    @watch_forums = WatchForum.all
  end

  # GET /watch_forums/1
  # GET /watch_forums/1.json
  def show
  end

  # GET /watch_forums/new
  def new
    @watch_forum = WatchForum.new
  end

  # GET /watch_forums/1/edit
  def edit
  end

  # POST /watch_forums
  # POST /watch_forums.json
  def create
    @watch_forum = WatchForum.where(user_id: watch_forum_params[:user_id]).where(forum_id: watch_forum_params[:forum_id]).first
    if @watch_forum
      @watch_orum.destroy
      render json: {'status': 'remove'}
    else
      @watch_forum = WatchForum.new(watch_forum_params)
      if @watch_forum.save
        render json: {'status': 'success'}
      else
        render json: {'status': 'error'}
      end
    end
  end

  # PATCH/PUT /watch_forums/1
  # PATCH/PUT /watch_forums/1.json
  def update
    respond_to do |format|
      if @watch_forum.update(watch_forum_params)
        format.html { redirect_to @watch_forum, notice: 'Watch forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @watch_forum }
      else
        format.html { render :edit }
        format.json { render json: @watch_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watch_forums/1
  # DELETE /watch_forums/1.json
  def destroy
    @watch_forum.destroy
    respond_to do |format|
      format.html { redirect_to watch_forums_url, notice: 'Watch forum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watch_forum
      @watch_forum = WatchForum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watch_forum_params
      params.require(:watch_forum).permit(:user_id, :forum_id)
    end
end
