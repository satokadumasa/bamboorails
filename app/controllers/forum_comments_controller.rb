class ForumCommentsController < ApplicationController
  before_action :set_forum_comment, only: [:show, :edit, :update, :destroy]

  # GET /forum_comments
  # GET /forum_comments.json
  def index
    @forum_comments = ForumComment.all
  end

  # GET /forum_comments/1
  # GET /forum_comments/1.json
  def show
  end

  # GET /forum_comments/new
  def new
    @forum_comment = ForumComment.new
  end

  # GET /forum_comments/1/edit
  def edit
  end

  # POST /forum_comments
  # POST /forum_comments.json
  def create
    @forum_comment = ForumComment.new(forum_comment_params)

    respond_to do |format|
      if @forum_comment.save
        format.html { redirect_to @forum_comment.forum, notice: 'Forum comment was successfully created.' }
        format.json { render :show, status: :created, location: @forum_comment }
      else
        format.html { render :new }
        format.json { render json: @forum_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_comments/1
  # PATCH/PUT /forum_comments/1.json
  def update
    respond_to do |format|
      if @forum_comment.update(forum_comment_params)
        format.html { redirect_to @forum_comment.forum, notice: 'Forum comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum_comment }
      else
        format.html { render :edit }
        format.json { render json: @forum_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_comments/1
  # DELETE /forum_comments/1.json
  def destroy
    @forum_comment.destroy
    respond_to do |format|
      format.html { redirect_to forum_comments_url, notice: 'Forum comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_comment
      @forum_comment = ForumComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_comment_params
      params.require(:forum_comment).permit(:user_id, :forum_id, :title, :detail)
    end
end
