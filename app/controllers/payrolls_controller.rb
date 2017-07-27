class PayrollsController < ApplicationController
    before_action :authorize

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
        @payroll_current = Payroll.last.payperiods

        # generate a new payroll
        if  !@payroll_current
            @payroll = Payroll.create(end_date: @pay_period_date)
            @employees.each do |e|
                @payroll.employees << e
            end
        elsif 
            @num_days >= 14
            @pay_period_date = Payroll.last.end_date + 14.days
            @payroll = Payroll.create(end_date: @pay_period_date) 

        else
            flash.now[:notice] = "No valid payperiods can be created"
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
            pretax_wage = wage_calculate(@employee.rate, hours[:reg_hours].to_f, hours[:ovr_hours].to_f)
            fed_deduction = @employee.federal_filing_status
            state_deduction = @employee.state_filing_status
            fed_taxes = fed_tax_calculator(pretax_wage, @employee.federal_filing_allowances)
            state_taxes = state_tax_calculator(pretax_wage, @employee.state_filing_allowances)
            wage = pretax_wage - (fed_taxes.abs + state_taxes.abs)
            @check = Check.create(employee_id: num, payperiod: @payperiod, check_name: "#{@employee.first_name} #{@employee.last_name}", check_total: wage.round(2), gross_total: pretax_wage.round(2), fed_taxes: fed_taxes.abs, state_taxes: state_taxes.abs)
        end
        redirect_to payroll_path
    end

private
    def wage_calculate(rate, reg_hours, ovr_hours)
        ((rate * reg_hours) + ((rate * 1.5) * ovr_hours)).round(2)
    end
    
    def fed_tax_calculator(wage, allowances)
        excess = 0
        base_tax = 0
        percent = 0
        allowance = 4050.80 * allowances
        taxable = (wage * 26) - allowance

        if taxable <= 9325
            base_tax = 0
            percent = 0.1
            excess = wage
        elsif taxable < 37_950
            base_tax = 932.5/26
            percent = 0.15
            excess = (wage - base_tax).abs
        elsif taxable < 91_900
            base_tax = 5226.25/26
            percent = 0.25
            excess = (wage - base_tax).abs
        elsif taxable < 191_650
            base_tax = 18_713.75/26
            percent = 0.28
            excess = (wage - base_tax).abs
        elsif taxable < 416_700
            base_tax = 46_643.75/26
            percent = 0.33
            excess = (wage - base_tax).abs
        elsif taxable < 418_400
            base_tax = 120_910.25/26
            percent = 0.35
            excess = (wage - base_tax).abs
        else taxable >= 418_400
            base_tax = 121_505.25/26
            percent = 0.396
            excess = (wage - base_tax).abs
        end
        fed_taxes = (base_tax + (excess * percent)).round(2)
    end

    
    def state_tax_calculator(wage, allowances)

        excess = 0
        base_tax = 0
        percent = 0
        allowance = 4050.80 * allowances
        taxable = (wage * 26)- allowance

        if taxable <= 8015
            base_tax = 0
            percent = 0.01
            excess = wage
        elsif taxable < 19_001
            base_tax = 80.15/26
            percent = 0.02
            excess = (wage - base_tax).abs
        elsif taxable < 29_989
            base_tax = 299.87/26
            percent = 0.04
            excess = (wage - base_tax).abs
        elsif taxable < 41_629
            base_tax = 739.39/26
            percent = 0.06
            excess = (wage - base_tax).abs
        elsif taxable < 52_612
            base_tax = 1437.79/26
            percent = 0.08
            excess = (wage - base_tax).abs
        elsif taxable < 268_750
            base_tax = 2316.43/26
            percent = 0.093
            excess = (wage - base_tax).abs
        elsif taxable >= 322_499
            base_tax = 22_417.26/26
            percent = 0.13
            excess = (wage - base_tax).abs
        elsif taxable < 537_498
            base_tax = 27_953.41/26
            percent = 0.113
            excess = (wage - base_tax).abs
        else taxable >= 537_498
            base_tax = 52_248.3/26
            percent = 0.123
            excess = (wage - base_tax).abs
        end
        state_taxes = (base_tax + (excess * percent)).round(2)
    end
end