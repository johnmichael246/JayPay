class PayrollsController < ApplicationController

    def index
        @payrolls = Payroll.all
        @employees = Employee.all
    end
    
    def show
        @payroll=Payroll.find(params[:id])
    end
    
    def new
        @employees = Employee.where(status: true)
        @initialize_date = Date.new(2017,6,25)
        @num_days = (Date.today - @initialize_date).to_i % 14
        @pay_period_date = Date.today - @num_days.days
        @pay_date = @pay_period_date + 5.days
        @payroll = Payroll.find_by(end_date: @pay_period_date)
        unless @payroll
            @payroll = Payroll.create(end_date: @pay_period_date)
            employees.each do |e|
                @payroll.employees << e
            end
        end      
    end
    
    def update

    end

    def create
        payroll = params[:payroll]
        payroll.each do |num, hours|
            Payperiod.create(employee_id: num, payroll_id: params[:id], reg_hours: hours[:reg_hours], ovr_hours: hours[:reg_hours])
        end
        redirect_to root_path
    end



end
