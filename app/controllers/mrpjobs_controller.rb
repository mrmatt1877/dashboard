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
    @amount = params[:amount].to_f

    if @amount.nil? || @amount == 0
      @time_to_sort = Time.now.to_date-45.days
    else
      @time_to_sort = Time.now.to_date-@amount.days
    end

    @sorting = @mrpjob.runtimes.order("date DESC")
    @completion_time = []
    @mrpjob.runtimes.each do |runtime|
      #if (runtime.date > Time.now.to_date-45.days)
      if (runtime.date > @time_to_sort)
        if (runtime.start_time > runtime.end_time)
          @completion_time.push(((runtime.end_time - runtime.start_time)/60) + 1440)
        else
          @completion_time.push((runtime.end_time - runtime.start_time)/60)
        end
      end
    end
    @running_average = @completion_time.sum / @completion_time.size.to_f
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
