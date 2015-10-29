class JuniorCompaniesController < ApplicationController
  before_action :set_junior_company, only: [:show, :edit, :update, :destroy]

  # GET /junior_companies
  # GET /junior_companies.json
  def index
    @junior_companies = JuniorCompany.all
  end

  # GET /junior_companies/1
  # GET /junior_companies/1.json
  def show
  end

  # GET /junior_companies/new
  def new
    @junior_company = JuniorCompany.new
    @federations = Federation.all
  end

  # GET /junior_companies/1/edit
  def edit
    @federations = Federation.all
  end

  # POST /junior_companies
  # POST /junior_companies.json
  def create
    @junior_company = JuniorCompany.new(junior_company_params)

    respond_to do |format|
      if @junior_company.save
        format.html { redirect_to @junior_company, notice: 'Junior company was successfully created.' }
        format.json { render :show, status: :created, location: @junior_company }
      else
        format.html { render :new }
        format.json { render json: @junior_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /junior_companies/1
  # PATCH/PUT /junior_companies/1.json
  def update
    respond_to do |format|
      if @junior_company.update(junior_company_params)
        format.html { redirect_to @junior_company, notice: 'Junior company was successfully updated.' }
        format.json { render :show, status: :ok, location: @junior_company }
      else
        format.html { render :edit }
        format.json { render json: @junior_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /junior_companies/1
  # DELETE /junior_companies/1.json
  def destroy
    @junior_company.destroy
    respond_to do |format|
      format.html { redirect_to junior_companies_url, notice: 'Junior company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_junior_company
      @junior_company = JuniorCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def junior_company_params
      params.require(:junior_company).permit(:name, :federation_id)
    end
end
