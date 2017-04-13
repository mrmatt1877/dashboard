class WelcomeController < ApplicationController
    def index
        @userdate = Time.now.to_date-7.days
        @mrpjobs = Mrpjob.all
        @runtimes = Runtime.all

        if @userdate == 0 || @userdate == nil?
          @searchdate = Time.now.to_date-7.days
        else
          @searchdate  = Time.now.to_date-6.days
        end

        @runtimewarnings = [["D56TAMPS01", 104],["D56NMRP", 24],["D56KMRP", 110],["D56ZZMRP", 55],["D56XMRP", 55],["D56RMRP", 13],["D56TUMRP", 80],["D56NOMRP", 46],["D56AMRP", 37],["D56CCMRP", 12]]
    end

end
