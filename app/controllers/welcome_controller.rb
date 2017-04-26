class WelcomeController < ApplicationController
    def index
        @mrpjobs = Mrpjob.all.order("id")
        @runtimes = Runtime.all.order("mrpjob_id")

        if params.has_key?(:date)
          @searchdate  = Date.parse params[:date].values.join("-")
        else
          @searchdate = Time.now.to_date
        end

        @runtimewarnings = [["D56TAMPS01", 104],["D56NMRP", 24],["D56KMRP", 110],["D56ZZMRP", 55],["D56XMRP", 55],["D56RMRP", 13],["D56TUMRP", 80],["D56NOMRP", 46],["D56AMRP", 37],["D56CCMRP", 12]]
    end

end
