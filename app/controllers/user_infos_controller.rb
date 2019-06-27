class UserInfosController < ApplicationController
  before_action :set_user_info, only: [:show, :edit, :update, :destroy]

  # GET /user_infos
  # GET /user_infos.json
  def index
    @user_infos = UserInfo.page(params[:page]).joins(:pref).eager_load(:pref).order(id: :asc)
    # @pages = Page.paginate(page: params[:page], per_page: 5).where(public_status: [0,1]).where(user_id: @user_info.user_id).order(created_at: :desc)
  end

  # GET /user_infos/1
  # GET /user_infos/1.json
  def show
    if params[:id] =~ /^[0-9]+$/
      @user_info = UserInfo.left_outer_joins(:pref, user: :notes).eager_load(:pref, user: :notes).find(params[:id])
    else
      @user_info = UserInfo.left_outer_joins(:pref, user: :notes).eager_load(:pref, user: :notes).where(name: params[:id]).first()
    end
    @notes = Note.where(user_id: @user_info.user_id)
    @notes = @notes.where(public_status: [0,1]) unless (current_user && current_user.id == @user_info.user_id)
    @notes = @notes.order(created_at: :desc)
    @user = @user_info.user
    respond_to do |format|
      format.html { render :show }
      format.json { render :show, status: :ok, location: @user_info }
    end
  end

  # GET /user_infos/new
  def new
    @user_info = UserInfo.new
    @prefs = Pref.all()
  end

  # GET /user_infos/1/edit
  def edit
  end

  # POST /user_infos
  # POST /user_infos.json
  def create
    @user_info = UserInfo.new(user_info_params)
    @prefs = Pref.all()

    respond_to do |format|
      if @user_info.save
        format.html { redirect_to @user_info, notice: 'User info was successfully created.' }
        format.json { render :show, status: :created, location: @user_info }
      else
        format.html { render :new }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_infos/1
  # PATCH/PUT /user_infos/1.json
  def update
    @prefs = Pref.all()
    purge_images(params[:user_info][:image_ids])

    respond_to do |format|
      if @user_info.update(user_info_params)
        format.html { redirect_to @user_info, notice: 'User info was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_info }
      else
        format.html { render :edit }
        format.json { render json: @user_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_infos/1
  # DELETE /user_infos/1.json
  def destroy
    @user_info.destroy
    respond_to do |format|
      format.html { redirect_to user_infos_url, notice: 'User info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_info
      if params[:id] =~ /^[0-9]+$/
        @user_info = UserInfo.left_outer_joins(:pref, user: :notes).eager_load(:pref, user: :notes).find(params[:id])
      else
        @user_info = UserInfo.left_outer_joins(:pref, user: :notes).eager_load(:pref, user: :notes).where(name: params[:id]).first()
      end
      @image = @user_info.profile_image_id ? @user_info.images.find(@user_info.profile_image_id) : nil
      @prefs = Pref.all()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_info_params
      params.require(:user_info).permit(:user_id, :name, :mobile, :pref_id, :postal_code, :address , :profile_image_id , :user_name, images: [])
    end

    def purge_images image_ids
      unless image_ids 
        return
      end
      image_ids.each do |image_id|
        image = @user_info.images.find(image_id)
        image.purge
      end
    end
end
