class BreadcrumbsController < ApplicationController
  before_action :set_breadcrumb, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /breadcrumbs
  # GET /breadcrumbs.json
  def index
    @breadcrumbs = Breadcrumb.all
  end

  # GET /breadcrumbs/1
  # GET /breadcrumbs/1.json
  def show
  end

  # GET /breadcrumbs/new
  def new
    @breadcrumb = Breadcrumb.new
  end

  # GET /breadcrumbs/1/edit
  def edit
    authorize @breadcrumb
  end

  # POST /breadcrumbs
  # POST /breadcrumbs.json
  def create
    @breadcrumb = Breadcrumb.new(breadcrumb_params.merge(user_created_id: current_user.id))

    respond_to do |format|
      if @breadcrumb.save
        format.html { redirect_to breadcrumbs_url, notice: I18n.t(:new, scope: [:generic, :confirmation]) }
        format.json { render :show, status: :created, location: @breadcrumb }
      else
        format.html { render :new }
        format.json { render json: @breadcrumb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breadcrumbs/1
  # PATCH/PUT /breadcrumbs/1.json
  def update
    authorize @breadcrumb

    respond_to do |format|
      if @breadcrumb.update(breadcrumb_params)
        format.html { redirect_to breadcrumbs_url, notice: I18n.t(:edit, scope: [:generic, :confirmation]) }
        format.json { render :show, status: :ok, location: @breadcrumb }
      else
        format.html { render :edit }
        format.json { render json: @breadcrumb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breadcrumbs/1
  # DELETE /breadcrumbs/1.json
  def destroy
    authorize @breadcrumb

    @breadcrumb.destroy
    respond_to do |format|
      format.html { redirect_to breadcrumbs_url, notice: I18n.t(:delete, scope: [:generic, :confirmation]) }
      format.json { head :no_content }
    end
  end

  # CUSTOM METHODS

  def update_paths_nested
    @path = Path.find(params[:id])
    if @path.update(path_params)
    respond_to do |format|
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breadcrumb
      @breadcrumb = Breadcrumb.find(params[:id])
    end

    def path_params
      params.require(:path).permit(:status, :description, :observation)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breadcrumb_params
      params.require(:breadcrumb).permit(
        :name,
        :description,
        :code,
        :progress,
        :user_created_id,
        :user_tested_id,
        :status,
        :observation,
        paths_attributes: [
          :id,
          :description,
          :status,
          :observation, 
          :_destroy
        ]
      )
    end
end
