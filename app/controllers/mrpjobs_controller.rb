class MrpjobsController < ApplicationController
  before_action :set_mrpjob, only: [:show, :edit, :update, :destroy]

  # GET /mrpjobs
  # GET /mrpjobs.json
  def index
    @mrpjobs = Mrpjob.all
  end

  # GET /mrpjobs/1
  # GET /mrpjobs/1.json
  def show
    @sorting = @mrpjob.runtimes.order("created_at DESC")
  end

  # GET /mrpjobs/new
  def new
    @mrpjob = Mrpjob.new
  end

  # GET /mrpjobs/1/edit
  def edit
  end

  # POST /mrpjobs
  # POST /mrpjobs.json
  def create
    @mrpjob = Mrpjob.new(mrpjob_params)

    respond_to do |format|
      if @mrpjob.save
        format.html { redirect_to @mrpjob, notice: 'Mrpjob was successfully created.' }
        format.json { render :show, status: :created, location: @mrpjob }
      else
        format.html { render :new }
        format.json { render json: @mrpjob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mrpjobs/1
  # PATCH/PUT /mrpjobs/1.json
  def update
    respond_to do |format|
      if @mrpjob.update(mrpjob_params)
        format.html { redirect_to @mrpjob, notice: 'Mrpjob was successfully updated.' }
        format.json { render :show, status: :ok, location: @mrpjob }
      else
        format.html { render :edit }
        format.json { render json: @mrpjob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mrpjobs/1
  # DELETE /mrpjobs/1.json
  def destroy
    @mrpjob.destroy
    respond_to do |format|
      format.html { redirect_to mrpjobs_url, notice: 'Mrpjob was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mrpjob
      @mrpjob = Mrpjob.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mrpjob_params
      params.require(:mrpjob).permit(:name, :description)
    end
end
