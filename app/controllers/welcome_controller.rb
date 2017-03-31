class WelcomeController < ApplicationController
    def index
        @mrpjobs = Mrpjob.all
        @runtimes = Runtime.all
        
    end
end
