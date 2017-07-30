class EmployeesController < ApplicationController
before_action :modify_employee, only: [:show, :edit, :update, :destroy]

before_action :authorize

    def index
        puts params
        if params[:search]
            @employees = Employee.where(:first_name => params[:search]).order("created_at DESC")
        else
            @employees = Employee.all.order("created_at DESC")
        end
    end
    
    def show
    end
    
    def new
        @employee = Employee.new
    end

    def edit
        @employee = Employee.find(params[:id])
        
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
            redirect_to employees_path
        else
            render :new
        end
        
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        redirect_to employees_path
    end

    private

        def modify_employee
            @employee=Employee.find(params[:id])
        end
        
        def employee_params
            params.require(:employee).permit(:first_name, :middle_i, :last_name, :street_address, :city, :state, :zipcode, :gender, :id_number, :admin, :status,:hire_date, :workers_comp_class, :work_location, :birthday, :jobtype, :rate,:paid_by, :social_security_number, :federal_filing_status, :federal_filing_allowances, :state_filing_status, :state_filing_allowances)
        end
end
