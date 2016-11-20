class WardsController < ApplicationController
  before_action :set_ward, only: [:show, :edit, :update, :destroy]

  # GET /wards
  # GET /wards.json
  def index
    @wards = Ward.all
  end

  # GET /wards/1
  # GET /wards/1.json
  def show
    @ward = Ward.find(params[:id])

    # https://www.youtube.com/watch?v=vp3nrafhjEc
    respond_to do |format|
      format.html
      format.pdf do
        pdf = WardPdf.new(@ward)
        send_data pdf.render, filename: "Ward_#{@ward.ward_number}.pdf",
                              type: "application/pdf",
                              disposition: "inline",
                              page_size: "A4",
                              page_layout: :landscape
      end
    end
  end

  # GET /wards/new
  def new
    @ward = Ward.new
  end

  # GET /wards/1/edit
  def edit
  end

  # POST /wards
  # POST /wards.json
  def create
    @ward = Ward.new(ward_params)

    respond_to do |format|
      if @ward.save
        format.html { redirect_to @ward, notice: 'Ward was successfully created.' }
        format.json { render :show, status: :created, location: @ward }
      else
        format.html { render :new }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wards/1
  # PATCH/PUT /wards/1.json
  def update
    respond_to do |format|
      if @ward.update(ward_params)
        format.html { redirect_to @ward, notice: 'Ward was successfully updated.' }
        format.json { render :show, status: :ok, location: @ward }
      else
        format.html { render :edit }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wards/1
  # DELETE /wards/1.json
  def destroy
    @ward.destroy
    respond_to do |format|
      format.html { redirect_to wards_url, notice: 'Ward was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ward
      @ward = Ward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ward_params
      params.require(:ward).permit(:zone, :ward_number, :ward_name, :ward_officer, :ward_officer_number, :corporator, :corporator_number, :inspector, :inspector_number, :jawan, :jawan_number, :amc_labour_male, :amc_labour_female, :pvt_labour_male, :pvt_labour_female, :total_labour_male, :total_labour_female, :v_haathgadi, :v_cyclericks, :v_hydraulicauto, :v_loadingauto, :v_tractor, :v_407, :hook_loader, :skip_loader, :households, :comm_est, :edu_est, :med_est, :waste_org, :waste_dry, :waste_org_qty, :waste_dry_qty, :waste_haz_qty)
    end
end
