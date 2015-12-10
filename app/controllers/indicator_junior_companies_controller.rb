class IndicatorJuniorCompaniesController < ApplicationController
  before_action :set_indicator_junior_company, only: [:show, :edit, :update, :destroy]

  # GET /indicator_junior_companies
  # GET /indicator_junior_companies.json
  def index
    @indicator_junior_companies = IndicatorJuniorCompany.all
  end

  # GET /indicator_junior_companies/1
  # GET /indicator_junior_companies/1.json
  def show
  end

  # GET /indicator_junior_companies/new
  def new
    @indicator_junior_company = IndicatorJuniorCompany.new
  end

  # GET /indicator_junior_companies/1/edit
  def edit
  end

  # POST /indicator_junior_companies
  # POST /indicator_junior_companies.json
  def create
    @indicator_junior_company = IndicatorJuniorCompany.new(indicator_junior_company_params)

    respond_to do |format|
      if @indicator_junior_company.save
        format.html { redirect_to @indicator_junior_company, notice: 'Indicator junior company was successfully created.' }
        format.json { render :show, status: :created, location: @indicator_junior_company }
      else
        format.html { render :new }
        format.json { render json: @indicator_junior_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicator_junior_companies/1
  # PATCH/PUT /indicator_junior_companies/1.json
  def update
    respond_to do |format|
      if @indicator_junior_company.update(indicator_junior_company_params)
        format.html { redirect_to @indicator_junior_company, notice: 'Indicator junior company was successfully updated.' }
        format.json { render :show, status: :ok, location: @indicator_junior_company }
      else
        format.html { render :edit }
        format.json { render json: @indicator_junior_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicator_junior_companies/1
  # DELETE /indicator_junior_companies/1.json
  def destroy
    @indicator_junior_company.destroy
    respond_to do |format|
      format.html { redirect_to indicator_junior_companies_url, notice: 'Indicator junior company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator_junior_company
      @indicator_junior_company = IndicatorJuniorCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicator_junior_company_params
      params.require(:indicator_junior_company).permit(:name, :value, :id_indicator, :id_junior_company)
    end
end
