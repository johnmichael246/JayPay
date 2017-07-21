class EmployeesController < ApplicationController
before_action :modify_employee, only: [:show, :edit, :update, :destroy]

before_action :authorize

    def index
        @employees = Employee.all
    end
    
    def show
    end
    
    def new
        @employee = Employee.new
    end

    def edit
        
    end

    def update
        if @employee.update_attributes(employee_params)
            redirect_to employees_path
        else
            render :edit
        end
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to employee_path
        else
            render :new
        end
        
    end

    def destroy
        @employee.destroy
    end
    


    private

        def modify_employee
            @employee=Employee.find(params[:id])
        end
        
        def employee_params
      params.require(:employee).permit(:first_name, :middle_i, :last_name, :Street_address, :city, :state, :gender, :id_number, :admin, :status, :hire_date, :workers_comp_class, :work_location, :birthday, :jobtype, :rate, :paid_by, :SS, :Federal_filing_status, :Federal_filing_allowances, :State_filing_status, :State_filing_allowances,)
    end
end
