class SummaryPhasesController < ApplicationController
  before_action :set_summary_phase, only: [:show, :edit, :update, :destroy]


  # GET /summary_phases
  # GET /summary_phases.json
  def index
    @summary_phases = SummaryPhase.all
  end

  # GET /summary_phases/1
  # GET /summary_phases/1.json
  def show
  end

  # GET /summary_phases/new
  def new
    @summary_phase = SummaryPhase.new
  end

  # GET /summary_phases/1/edit
  def edit
    @summary_phase = SummaryPhase.find(params[:id])

  end

  # POST /summary_phases
  # POST /summary_phases.json
  def create
    @summary_phase = SummaryPhase.new(summary_phase_params)

    respond_to do |format|
      if @summary_phase.save
        format.html { redirect_to @summary_phase, notice: 'Summary phase was successfully created.' }
        format.json { render :show, status: :created, location: @summary_phase }
      else
        format.html { render :new }
        format.json { render json: @summary_phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summary_phases/1
  # PATCH/PUT /summary_phases/1.json
  def update
    respond_to do |format|
      if @summary_phase.update(summary_phase_params)
        format.html { redirect_to @summary_phase, notice: 'Summary phase was successfully updated.' }
        format.json { render :show, status: :ok, location: @summary_phase }
      else
        format.html { render :edit }
        format.json { render json: @summary_phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summary_phases/1
  # DELETE /summary_phases/1.json
  def destroy
    @summary_phase.destroy
    respond_to do |format|
      format.html { redirect_to summary_phases_url, notice: 'Summary phase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summary_phase
      @summary_phase = SummaryPhase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summary_phase_params
      params.fetch(:summary_phase, {})
    end
end
