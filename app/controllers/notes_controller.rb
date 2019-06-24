class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_collections, only: [:new, :create, :show, :edit, :update ]

  # GET /notes
  # GET /notes.json
  def index
    @catefories = Category.all()
    @notes = Note.page(params[:page]).eager_load(user: :user_info).where(public_status: [0,1]).order(created_at: :desc)
    @notes = @notes.where(category_id: params[:p][:category_id]) if params[:p] && params[:p][:category_id]
    @notes = @notes.where('title LIKE ?', '%' << params[:title] << '%') if params[:title]
    @notes = @notes.where('body LIKE ?', '%' << params[:body] << '%') if params[:body]
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @overview = @note.body.slice(0, 200)
    @title = @note.title
    if current_user
      @bookmark = Bookmark.new
      @bookmark.note_id = @note.id
      @bookmark.user_id = current_user.id
    end
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @categories = Category.all()

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @categories = Category.all()
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.eager_load(:pages, :user => [:user_info]).find(params[:id])
      @categories = Category.all()
    end

    def set_collections
      @public_statuses = YAML.load_file(ENV['RBENV_DIR'] + '/config/public_status.yml')[(I18n.default_locale).to_s.gsub(/:/, '')]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:user_id, :category_id, :public_status, :title, :body)
    end
    def check_permission
      unless current_user || @note.user_id == current_user.id
        flash[:alert] = "【警告】権限がありません。"
        redirect_to root_path
      end
    end
end
