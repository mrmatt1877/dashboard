class WelcomeController < ApplicationController
    def index
        @mrpjobs = Mrpjob.all.order("id")
        @runtimes = Runtime.all.order("mrpjob_id")

        if params.has_key?(:date)
          @searchdate  = Date.parse params[:date].values.join("-")
        else
          @searchdate = Time.now.to_date
        end

        @runtimewarnings = [["D56TAMPS01", 68],["D56NMRP", 31],["D56KMRP", 67],["D56ZZMRP", 123],["D56XMRP", 41],["D56RMRP", 8],["D56TUMRP", 26],["D56NOMRP", 25],["D56AMRP", 16],["D56CCMRP", 6]]
    end

end
