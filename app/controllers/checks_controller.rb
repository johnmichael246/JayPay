class ChecksController < ApplicationController
end

def show
    @check = Check.find(params[:id])
end

def index
    @prid = params[:payroll_id]
    if (prid)
        Check.find({payroll_id:prid})
    else
        @checks = Check.where(@current_payroll)
    end
end

def new
    @check = Check.new(params.require(:check).permit(:check_total,:check_name))
    @payroll = Payroll.create(end_date: @pay_period_date)
    unless @checks
        @checks = Check.create()
    end 
end

def create
end


