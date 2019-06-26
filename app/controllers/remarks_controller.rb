class RemarksController < ApplicationController
  before_action :set_remark, only: [:show, :edit, :update, :destroy]

  # GET /remarks
  # GET /remarks.json
  def index
    @remarks = Remark.all
  end

  # GET /remarks/1
  # GET /remarks/1.json
  def show
    remarks = Remark.eager_load(user: :user_info).where('remarks.created_at > ? ', Time.now() - 3600).where(lounge_id: remark_params[:lounge_id])
    @remarks = remark.resp_with_json(remarks)
  end

  # GET /remarks/new
  def new
    @remark = Remark.new
  end

  # GET /remarks/1/edit
  def edit
  end

  # POST /remarks
  # POST /remarks.json
  def create
    @remark = Remark.new(remark_params)
    @remark.save
    render json: @remark
  end

  # PATCH/PUT /remarks/1
  # PATCH/PUT /remarks/1.json
  def update
    respond_to do |format|
      if @remark.update(remark_params)
        format.html { redirect_to @remark, notice: 'Remark was successfully updated.' }
        format.json { render :show, status: :ok, location: @remark }
      else
        format.html { render :edit }
        format.json { render json: @remark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remarks/1
  # DELETE /remarks/1.json
  def destroy
    @remark.destroy
    respond_to do |format|
      format.html { redirect_to remarks_url, notice: 'Remark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remark
      @remark = Remark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remark_params
      params.require(:remark).permit(:lounge_id, :user_id, :content)
    end
end
