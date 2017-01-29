class RuntimesController < ApplicationController
  before_action :set_runtime, only: [:show, :edit, :update, :destroy]

  # GET /runtimes
  # GET /runtimes.json
  def index
    @runtimes = Runtime.all.order("created_at DESC")
    @mrpjobs = Mrpjob.all
  end

  # GET /runtimes/1
  # GET /runtimes/1.json
  def show
    @mrpjobs = Mrpjob.all
  end

  # GET /runtimes/new
  def new
    @runtime = Runtime.new
    @mrpjobs = Mrpjob.all
  end

  # GET /runtimes/1/edit
  def edit
    @mrpjobs = Mrpjob.all
  end

  # POST /runtimes
  # POST /runtimes.json
  def create
    @runtime = Runtime.new(runtime_params)
    @mrpjobs = Mrpjob.all

    respond_to do |format|
      if @runtime.save
        format.html { redirect_to runtimes_path, notice: 'Runtime was successfully created.' }
        format.json { render :show, status: :created, location: @runtime }
      else
        format.html { render :new }
        format.json { render json: @runtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /runtimes/1
  # PATCH/PUT /runtimes/1.json
  def update
    respond_to do |format|
      if @runtime.update(runtime_params)
        format.html { redirect_to @runtime, notice: 'Runtime was successfully updated.' }
        format.json { render :show, status: :ok, location: @runtime }
      else
        format.html { render :edit }
        format.json { render json: @runtime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runtimes/1
  # DELETE /runtimes/1.json
  def destroy
    @runtime.destroy
    respond_to do |format|
      format.html { redirect_to runtimes_url, notice: 'Runtime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_runtime
      @runtime = Runtime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def runtime_params
      params.require(:runtime).permit(:start_time, :end_time, :date, :mrpjob_id)
    end
end
