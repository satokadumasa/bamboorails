class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]

  # GET /forums
  # GET /forums.json
  def index
    # @forums = Forum.all
    @forums = Forum.page(params[:page]).eager_load(:forum_comments, user: :user_info).order(id: :desc)
    @forums = @forums.where(forum_category_id: params[:p][:forum_category_id]) if params[:p] && params[:p][:forum_category_id]
    @forums = @forums.where('forums.title LIKE ?', '%' << params[:title] << '%') if params[:title]
    @forums = @forums.where('forums.detail LIKE ?', '%' << params[:detail] << '%') if params[:detail]
    @categories = ForumCategory.all()
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
    @overview = @forum.detail.slice(0, 200)
    @title = @forum.title
    if current_user
      @watch_forum = WatchForum.new
      @watch_forum.user_id = current_user.id
      @watch_forum.forum_id = @forum.id
    end
  end

  # GET /forums/new
  def new
    @forum = Forum.new
    @categories = ForumCategory.all()
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  # POST /forums.json
  def create
    @forum = Forum.new(forum_params)

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render :show, status: :created, location: @forum }
      else
        format.html { render :new }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum }
      else
        format.html { render :edit }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url, notice: 'Forum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
      @categories = ForumCategory.all()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:user_id, :forum_category_id, :title, :detail)
    end
end
