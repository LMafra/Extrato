class OrganogramsController < ApplicationController
  before_action :set_organogram, only: [:show, :edit, :update, :destroy]

  # GET /organograms
  # GET /organograms.json
  def index
    @organograms = Organogram.all
  end

  # GET /organograms/1
  # GET /organograms/1.json
  def show
  end

  # GET /organograms/new
  def new
    @organogram = Organogram.new
    @federations = Federation.all
    @juniorCompanies = JuniorCompany.all
  end

  # GET /organograms/1/edit
  def edit
    @federations = Federation.all
    @juniorCompanies = JuniorCompany.all
  end

  # POST /organograms
  # POST /organograms.json
  def create
    @organogram = Organogram.new(organogram_params)

    respond_to do |format|
      if @organogram.save
        format.html { redirect_to @organogram, notice: 'Organogram was successfully created.' }
        format.json { render :show, status: :created, location: @organogram }
      else
        format.html { render :new }
        format.json { render json: @organogram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organograms/1
  # PATCH/PUT /organograms/1.json
  def update
    respond_to do |format|
      if @organogram.update(organogram_params)
        format.html { redirect_to @organogram, notice: 'Organogram was successfully updated.' }
        format.json { render :show, status: :ok, location: @organogram }
      else
        format.html { render :edit }
        format.json { render json: @organogram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organograms/1
  # DELETE /organograms/1.json
  def destroy
    @organogram.destroy
    respond_to do |format|
      format.html { redirect_to organograms_url, notice: 'Organogram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organogram
      @organogram = Organogram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organogram_params
      params.require(:organogram).permit(:federation_id, :junior_company_id, :date_initial, :date_final)
    end
end
