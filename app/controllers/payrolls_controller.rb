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
            pretax_wage = wage_calculate(@employee.rate, hours[:reg_hours].to_f, hours[:ovr_hours].to_f)
            fed_deduction = @employee.federal_filing_status
            state_deduction = @employee.state_filing_status
            fed_taxes = fed_tax_calculator(pretax_wage, @employee.federal_filing_allowances)
            state_taxes = state_tax_calculator(pretax_wage, @employee.state_filing_allowances)
            wage = pretax_wage - (fed_taxes + state_taxes)
            @check = Check.create(employee_id: num, payperiod: @payperiod, check_name: "#{@employee.first_name} #{@employee.last_name}", check_total: wage)
        end
        redirect_to payroll_path
    end

private
    def wage_calculate(rate, reg_hours, ovr_hours)
        rate * (reg_hours + (ovr_hours * 1.5))
    end
    
    def fed_tax_calculator(wage, allowances)
        excess = 0
        base_tax = 0
        percent = 0
        allowance = 4050.80 * allowances
        taxable = (wage * 26)-allowances

        if taxable <= 9325
            base_tax = 0
            percent = 0.1
            excess = wage
        elsif taxable < 37_950
            base_tax = 932.5
            percent = 0.15
            excess = wage - 9325
        elsif taxable < 91_900
            base_tax = 5226.25
            percent = 0.25
            excess = (wage - 5226.25).abs
        elsif taxable < 191_650
            base_tax = 18_713.75
            percent = 0.28
            excess = (wage - 18_713.75).abs
        elsif taxable < 416_700
            base_tax = 46_643.75
            percent = 0.33
            excess = (wage - 46_643.75).abs
        elsif taxable < 418_400
            base_tax = 120_910.25
            percent = 0.35
            excess = (wage - 120_910.25).abs
        else taxable >= 418_400
            base_tax = 121_505.25
            percent = 0.396
            excess = (wage - 121_505.25).abs
        end
        fed_taxes = base_tax + (excess * percent)
    end

    
    def state_tax_calculator(wage, allowances)

        excess = 0
        base_tax = 0
        percent = 0
        allowance = 4050.80 * allowances
        taxable = (wage * 26)- allowances

        if taxable <= 8015
            base_tax = 0
            percent = 0.01
            excess = wage
        elsif taxable < 19_001
            base_tax = 80.15
            percent = 0.02
            excess = wage - 8015
        elsif taxable < 29_989
            base_tax = 299.87
            percent = 0.04
            excess = (wage - 299.87).abs
        elsif taxable < 41_629
            base_tax = 739.39
            percent = 0.06
            excess = (wage - 739.39).abs
        elsif taxable < 52_612
            base_tax = 1437.79
            percent = 0.08
            excess = (wage - 52_612).abs
        elsif taxable < 268_750
            base_tax = 2316.43
            percent = 0.093
            excess = (wage - 2316.43).abs
        elsif taxable >= 322_499
            base_tax = 22_417.26
            percent = 0.13
            excess = (wage - 22_417.26).abs
        elsif taxable < 537_498
            base_tax = 27_953.41
            percent = 0.113
            excess = (wage - 27_953.41).abs
        else taxable >= 537_498
            base_tax = 52_248.3
            percent = 0.123
            excess = (wage - 52_248.3).abs
        end
        state_taxes = base_tax + (excess * percent)
    end
    
    

end


