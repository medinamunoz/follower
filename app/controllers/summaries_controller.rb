class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]
 

  # GET /summaries
  # GET /summaries.json
  def index
    @summaries = Summary.all.order("resolution").page(params[:page]).per(10)
    
   
  end

  # GET /summaries/1
  # GET /summaries/1.json
  def show
    @summary = Summary.find(params[:id])
    authorize! :read, @summary
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
    @phases = Phase.find(summary_params[:phases_ids].delete_if{ |x| x.empty?})
    @summary.phases << @phases

    

    respond_to do |format|
      if @summary.save
        UserMailer.welcome().deliver_now()
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
    
    @phases = Phase.find(@summary_params[:phases_ids].delete_if{ |x| x.empty?})
    @summary.phases << @phases
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

  def delete_phase
    @summary = Summary.find(params[:id])
    phase = Phase.find(params[:phase_id])
    @summary.phases.delete(phase)
    redirect_to summary_path, notice: "Fase borrada del Sumario #{@summary}"
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summary
      @summary = Summary.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def summary_params
      params.require(:summary).permit(:description, :note, :resolution, :starting_day, :close_day, :id, :name, summary_users_attributes: [:id, :user_id, :_destroy], phases_ids: [])
    end
end
