class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :get_album, only: [:new, :edit, :update, :destroy]
  before_action :set_collections, only: [:new, :show, :edit ]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.left_outer_joins(:note, :user => [:user_info]).eager_load(:note, :user => [:user_info]).where(note_id: params[:note_id]).where(public_status: [0,1])
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @overview = @page.detail.slice(0, 200)
    @title = @page.title
    @previous = @page.previous
    @next = @page.next
  end

  # GET /pages/new
  def new
    @page = Page.new
    @page.note_id = params[:note_id]
    @album = @albums[0] if @albums
  end

  # GET /pages/1/edit
  def edit
    @note = Note.find(@page.note_id)
    @album = @albums[0] if @albums
  end

  # POST /pages
  # POST /pages.json
  def create
    Note.transaction do
      @note = Note.find(params[:page][:note_id])
      @page = @note.pages.create(page_params)
    end
    redirect_to note_path(@note)

  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    Note.transaction do
      @page = Page.find(params[:id])
      @page.update(page_params)
    end
    redirect_to note_path(@page.note_id)
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    # @page.destroy
    @note = Note.find(params[:article_id])
    @pages = @note.pages.find(params[:id])
    @pages.destroy
    redirect_to article_path(@note)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.eager_load(:page_comments, :note => [:pages], :user => [:user_info]).find(params[:id])
      # @note = Note.left_outer_joins(:pages, :user => [:user_info]).eager_load(:pages, :user => [:user_info]).find(params[:id])
      @public_statuses = YAML.load_file(ENV['RBENV_DIR'] + '/config/public_status.yml')
    end

    def set_collections
      @public_statuses = YAML.load_file(ENV['RBENV_DIR'] + '/config/public_status.yml')[(I18n.default_locale).to_s.gsub(/:/, '')]
    end

    def get_album
      @albums = Album.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:id, :user_id, :note_id, :public_status, :title, :detail)
    end
end
