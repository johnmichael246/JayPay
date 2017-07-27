class PayperiodsController < ApplicationController
    before_action :authorize
    def show
        @check = Check.find(params[:id])
    end
end
