class LoungesController < ApplicationController
  before_action :set_lounge, only: [:show, :edit, :update, :destroy]

  # GET /lounges
  # GET /lounges.json
  def index
    @lounges = Lounge.all
  end

  # GET /lounges/1
  # GET /lounges/1.json
  def show
    if current_user
      @last_posted_at = current_user.last_sign_in_at ? current_user.last_sign_in_at : Time.current
    end
  end

  # GET /lounges/new
  def new
    @lounge = Lounge.new
  end

  # GET /lounges/1/edit
  def edit
  end

  # POST /lounges
  # POST /lounges.json
  def create
    @lounge = Lounge.new(lounge_params)

    respond_to do |format|
      if @lounge.save
        format.html { redirect_to @lounge, notice: 'Lounge was successfully created.' }
        format.json { render :show, status: :created, location: @lounge }
      else
        format.html { render :new }
        format.json { render json: @lounge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lounges/1
  # PATCH/PUT /lounges/1.json
  def update
    respond_to do |format|
      if @lounge.update(lounge_params)
        format.html { redirect_to @lounge, notice: 'Lounge was successfully updated.' }
        format.json { render :show, status: :ok, location: @lounge }
      else
        format.html { render :edit }
        format.json { render json: @lounge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lounges/1
  # DELETE /lounges/1.json
  def destroy
    @lounge.destroy
    respond_to do |format|
      format.html { redirect_to lounges_url, notice: 'Lounge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lounge
      @lounge = Lounge.eager_load(:remarks).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lounge_params
      params.require(:lounge).permit(:user_id, :title, :overview)
    end
end
