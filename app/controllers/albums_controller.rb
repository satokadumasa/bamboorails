class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :image_urls, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
  end

  def image_urls
    @image_urls = []
    @album.images.each do |image|
      @image_urls.push({url: url_for(image).gsub(request.base_url, '')})
      logger.debug("AlbumsController.image_urls image:" << image.inspect)
    end
    logger.debug("AlbumsController.image_urls image_urls:" << @image_urls.inspect)
    render json: @image_urls
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    logger.debug("AlbumsController.update params:" << params.inspect)
    purge_images(params[:album][:image_ids])
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def image_list
    format.json { render :show, location: @album }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.eager_load(user: [:user_info]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:user_id, :title, :description, images: [])
    end

    # Album Image delete
    def purge_images image_ids
      unless image_ids 
        return
      end
      image_ids.each do |image_id|
        image = @album.images.find(image_id)
        image.purge
      end
    end
end
