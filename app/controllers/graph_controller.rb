class GraphController < ApplicationController
  def index
  end
 
  def data
    @mrpjob = Mrpjob.all
    @runtimes = Runtime.all
    respond_to do |format|
      format.json {
        render :json => @mrpjob.first.runtimes
      }
    end
  end
end
