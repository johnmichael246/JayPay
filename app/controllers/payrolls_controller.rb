class PayrollsController < ApplicationController

    def index
        @payrolls = Payroll.all
        @employees = Employee.all
        @initialize_date = Date.new(2017,6,25)
        @num_days = (Date.today - @initialize_date).to_i % 14
        @pay_period_date = Date.today - @num_days.days
        @pay_date = @pay_period_date + 5.days 
    end
    
    def show
        @payroll = Payroll.find(params[:id])
    end
    
    def new
        @employees = Employee.where(status: true)
        @initialize_date = Date.new(2017,6,25)
        @num_days = (Date.today - @initialize_date).to_i % 14
        @pay_period_date = Date.today - @num_days.days
        @pay_date = @pay_period_date + 5.days
        @payroll = Payroll.find_by(end_date: @pay_period_date)
        @payroll_current = Payroll.last.current
        # generate a new payroll
        if  @payroll_current
            @payroll = Payroll.create(end_date: @pay_period_date)
            @employees.each do |e|
                @payroll.employees << e
            end
        end
    end
    
    def update

    end

    def create
        # saves the payroll into DB
        payroll = params[:payroll]
        payroll.each do |num, hours|
            @payperiod = Payperiod.create(employee_id: num, payroll_id: params[:id], reg_hours: hours[:reg_hours], ovr_hours: hours[:ovr_hours])
            @employee = Employee.find(num)
            wage = wage_calculate(@employee.rate, hours[:reg_hours].to_f, hours[:ovr_hours].to_f)
            @check = Check.create(employee_id: num, payperiod: @payperiod, check_name: "#{@employee.first_name} #{@employee.last_name}", check_total: wage)
        end
        redirect_to payroll_path
    end

private
    def wage_calculate(rate, reg_hours, ovr_hours)
        rate * (reg_hours + (ovr_hours * 1.5))
    end

end
