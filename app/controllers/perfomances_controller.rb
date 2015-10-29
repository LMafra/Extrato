class PerfomancesController < ApplicationController
  before_action :set_perfomance, only: [:show, :edit, :update, :destroy]

  # GET /perfomances
  # GET /perfomances.json
  def index
    @perfomances = Perfomance.all
  end

  # GET /perfomances/1
  # GET /perfomances/1.json
  def show
  end

  # GET /perfomances/new
  def new
    @perfomance = Perfomance.new
    @junior_companies = JuniorCompany.all
    @federations = Federation.all
    @roles = Role.all
  end

  # GET /perfomances/1/edit
  def edit
  end

  # POST /perfomances
  # POST /perfomances.json
  def create
    @perfomance = Perfomance.new(perfomance_params)

    respond_to do |format|
      if @perfomance.save
        format.html { redirect_to @perfomance, notice: 'Perfomance was successfully created.' }
        format.json { render :show, status: :created, location: @perfomance }
      else
        format.html { render :new }
        format.json { render json: @perfomance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfomances/1
  # PATCH/PUT /perfomances/1.json
  def update
    respond_to do |format|
      if @perfomance.update(perfomance_params)
        format.html { redirect_to @perfomance, notice: 'Perfomance was successfully updated.' }
        format.json { render :show, status: :ok, location: @perfomance }
      else
        format.html { render :edit }
        format.json { render json: @perfomance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfomances/1
  # DELETE /perfomances/1.json
  def destroy
    @perfomance.destroy
    respond_to do |format|
      format.html { redirect_to perfomances_url, notice: 'Perfomance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfomance
      @perfomance = Perfomance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfomance_params
      params.require(:perfomance).permit(:name, :junior_companies_id, :federations_id, :role_id)
    end
end
