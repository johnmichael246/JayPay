class PayperiodsController < ApplicationController
    before_action :authorize
    def show
        @check = Payperiod.find(params[:id])
    end
end
