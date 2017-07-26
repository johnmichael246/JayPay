class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    helper_method :current_user, :check_adder

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authorize
      redirect_to login_path, alert: "You must log in to proceed" if current_user.nil?
    end
    
    def current_payroll
      @current_payroll = Payroll.last
    end


    #  Given a single payroll produce a single value which corresponds to the sum of all checks for a payperiod 
    def check_adder(payroll)
      @check_total = 0
      payroll.payperiods.each do |payperiod|
        payperiod.checks.each do |check|
          @check_total += check.check_total
        end
      end
      return @check_total
    end

    def gross_check(payroll)
      @gross_check_total = 0
      payroll.payperiods.each do |payperiod|
        payperiod.checks.each do |check|
          @gross_check_total += check.check_total
        end
      end
      return @gross_check_total
    end
    
    def check_count(payroll)
      payroll.payperiod.each do |payperiod|
        payperiod.checks.count
      end
    end
    

    
end
