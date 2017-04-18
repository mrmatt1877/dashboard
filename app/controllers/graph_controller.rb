class GraphController < ApplicationController
  def index
    if params.has_key?(:graph_id)
      $graph_id = params[:graph_id].to_i
    else
      $graph_id = 0
    end
    @mrpjob = Mrpjob.all
    @mrpname = @mrpjob[$graph_id].description
  end

  def data
    @mrpjob = Mrpjob.all
    @runtimes = Runtime.all
    @array_of_times = []
    @mrpjob[$graph_id].runtimes.order('date DESC').each do |f|
                            @start_time = f.start_time.strftime('%H:%M')
                            @end_time = f.end_time.strftime('%H:%M')
                            @date= f.date.strftime('%Y/%m/%d')

                            if (f.start_time > f.end_time)
                              @completion_time = ((f.end_time - f.start_time)/60).floor + 1440
                            else
                              @completion_time = ((f.end_time - f.start_time)/60).floor
                            end

                            @array_of_times.push(completion_time: @completion_time, date: @date)
    end
    respond_to do |format|
      format.json {
        render :json => @array_of_times
      }
    end
  end
end
