class ForumCategoriesController < ApplicationController
  before_action :set_forum_category, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  # GET /forum_categories
  # GET /forum_categories.json
  def index
    @forum_categories = ForumCategory.all
  end

  # GET /forum_categories/1
  # GET /forum_categories/1.json
  def show
  end

  # GET /forum_categories/new
  def new
    @forum_category = ForumCategory.new
  end

  # GET /forum_categories/1/edit
  def edit
  end

  # POST /forum_categories
  # POST /forum_categories.json
  def create
    @forum_category = ForumCategory.new(forum_category_params)

    respond_to do |format|
      if @forum_category.save
        format.html { redirect_to @forum_category, notice: 'Forum category was successfully created.' }
        format.json { render :show, status: :created, location: @forum_category }
      else
        format.html { render :new }
        format.json { render json: @forum_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_categories/1
  # PATCH/PUT /forum_categories/1.json
  def update
    respond_to do |format|
      if @forum_category.update(forum_category_params)
        format.html { redirect_to @forum_category, notice: 'Forum category was successfully updated.' }
        format.json { render :show, status: :ok, location: @forum_category }
      else
        format.html { render :edit }
        format.json { render json: @forum_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_categories/1
  # DELETE /forum_categories/1.json
  def destroy
    @forum_category.destroy
    respond_to do |format|
      format.html { redirect_to forum_categories_url, notice: 'Forum category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_category
      @forum_category = ForumCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_category_params
      params.require(:forum_category).permit(:name)
    end

    def check_admin
      redirect_to root_path, notice: 'Pref was successfully destroyed.'  unless current_user.is_admin
    end
end
