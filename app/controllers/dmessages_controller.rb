class DmessagesController < ApplicationController
  before_action :set_dmessage, only: [:show, :edit, :update, :destroy]

  # GET /dmessages
  # GET /dmessages.json
  def index
    @send_messages = current_user.send_messages
    @recv_messages = current_user.recv_messages
  end

  # GET /dmessages/1
  # GET /dmessages/1.json
  def show
    @dmessage.received_at = Time.current
    @dmessage.save
  end

  # GET /dmessages/new
  def new
    @dmessage = Dmessage.new
    @dmessage.sender_id = current_user.id
    @dmessage.receiver_id = params[:receiver_id]
    @receiver = User.left_outer_joins(:user_info).find(params[:receiver_id].to_i)
  end

  # GET /dmessages/1/edit
  def edit
  end

  # POST /dmessages
  # POST /dmessages.json
  def create
    @dmessage = Dmessage.new(dmessage_params)

    respond_to do |format|
      if @dmessage.save
        format.html { redirect_to @dmessage, notice: 'Dmessage was successfully created.' }
        format.json { render :show, status: :created, location: @dmessage }
      else
        @receiver = User.left_outer_joins(:user_info).find(dmessage_params[:receiver_id].to_i)
        format.html { render :new }
        format.json { render json: @dmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dmessages/1
  # PATCH/PUT /dmessages/1.json
  def update
    respond_to do |format|
      if @dmessage.update(dmessage_params)
        format.html { redirect_to @dmessage, notice: 'Dmessage was successfully updated.' }
        format.json { render :show, status: :ok, location: @dmessage }
      else
        format.html { render :edit }
        format.json { render json: @dmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dmessages/1
  # DELETE /dmessages/1.json
  def destroy
    # @dmessage.destroy
    @dmessage.deleted_at = Time.current
    @dmessage.save

    respond_to do |format|
      format.html { redirect_to dmessages_url, notice: 'Dmessage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dmessage
      @dmessage = Dmessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dmessage_params
      params.require(:dmessage).permit(:sender_id, :receiver_id, :received_at, :deleted_at, :title, :detail)
    end
end
