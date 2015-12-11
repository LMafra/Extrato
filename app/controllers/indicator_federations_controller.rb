class IndicatorFederationsController < ApplicationController
  before_action :set_indicator_federation, only: [:show, :edit, :update, :destroy]

  # GET /indicator_federations
  # GET /indicator_federations.json
  def index
    @indicator_federations = IndicatorFederation.all
  end

  # GET /indicator_federations/1
  # GET /indicator_federations/1.json
  def show
  end

  # GET /indicator_federations/new
  def new
    @indicator_federation = IndicatorFederation.new
  end

  # GET /indicator_federations/1/edit
  def edit
  end

  # POST /indicator_federations
  # POST /indicator_federations.json
  def create
    @indicator_federation = IndicatorFederation.new(indicator_federation_params)

    respond_to do |format|
      if @indicator_federation.save
        format.html { redirect_to @indicator_federation.indicator, notice: 'Indicator federation was successfully created.' }
        format.json { render :show, status: :created, location: @indicator_federation }
      else
        format.html { render :new }
        format.json { render json: @indicator_federation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicator_federations/1
  # PATCH/PUT /indicator_federations/1.json
  def update
    respond_to do |format|
      if @indicator_federation.update(indicator_federation_params)
        format.html { redirect_to @indicator_federation, notice: 'Indicator federation was successfully updated.' }
        format.json { render :show, status: :ok, location: @indicator_federation }
      else
        format.html { render :edit }
        format.json { render json: @indicator_federation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicator_federations/1
  # DELETE /indicator_federations/1.json
  def destroy
    @indicator_federation.destroy
    respond_to do |format|
      format.html { redirect_to indicator_federations_url, notice: 'Indicator federation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator_federation
      @indicator_federation = IndicatorFederation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicator_federation_params
      params.require(:indicator_federation).permit(:value, :federation_id, :indicator_id)
    end
end
