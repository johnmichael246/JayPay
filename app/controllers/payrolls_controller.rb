class PayrollsController < ApplicationController

    def index
        @payrolls = Payroll.all
    end
    
    def show
    end
    
    def new
        @payroll = Payrol.new
    end
    
    def create
        
    end
    
end
