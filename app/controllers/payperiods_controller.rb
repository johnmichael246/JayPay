class PayperiodsController < ApplicationController
    def show
        @payperiod = Payperiod.find(params[:id])
    end
end
