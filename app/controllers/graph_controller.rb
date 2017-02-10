class GraphController < ApplicationController
  def index
  end
 
  def data
    
    @mrpjob = Mrpjob.all
    @runtimes = Runtime.all
    @array_of_times = []
    @mrpjob.first.runtimes.order('date DESC').each do |f|
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
