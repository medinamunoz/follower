class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource

  # GET /summaries
  # GET /summaries.json
  def index
    @summaries = Summary.all
   
  end

  # GET /summaries/1
  # GET /summaries/1.json
  def show
  end

  # GET /summaries/new
  def new
    @summary = Summary.new
    @summary_user = SummaryUser.new
    @user = current_user
  end

  # GET /summaries/1/edit
  def edit
  end

  # POST /summaries
  # POST /summaries.json
  def create
    @summary = Summary.new(summary_params)
    @summary.user = current_user

    respond_to do |format|
      if @summary.save
        format.html { redirect_to @summary, notice: 'Summary was successfully created.' }
        format.json { render :show, status: :created, location: @summary }
      else
        format.html { render :new }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summaries/1
  # PATCH/PUT /summaries/1.json
  def update
    respond_to do |format|
      if @summary.update(summary_params)
        format.html { redirect_to @summary, notice: 'Summary was successfully updated.' }
        format.json { render :show, status: :ok, location: @summary }
      else
        format.html { render :edit }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summaries/1
  # DELETE /summaries/1.json
  def destroy
    @summary.destroy
    respond_to do |format|
      format.html { redirect_to summaries_url, notice: 'Summary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summary
      @summary = Summary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summary_params
      params.require(:summary).permit(:description, :note, :resolution, :starting_day, :close_day, summary_users_attributes: [:id, :user_id, :_destroy])
    end
end
