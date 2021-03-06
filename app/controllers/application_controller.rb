class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
    helper_method :current_user, :check_adder, :gross_check, :check_count

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
    def gross_check(payroll)
        @gross_check_total = 0
        payroll.payperiods.each do |payperiod|
          @gross_check_total += payperiod.check.gross_total if payperiod.check
      end
      @gross_check_total
    end

    def check_adder(payroll)
      @check_total = 0
      payroll.payperiods.each do |payperiod|
        @check_total += payperiod.check.check_total if payperiod.check
      end
      @check_total
    end
  

end
