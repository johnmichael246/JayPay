class EmployeesController < ApplicationController
before_action :modify_employee, only: [:show, :edit, :update, :destroy]

before_action :authorize

    def index
        @employees = Employee.all.order("created_at DESC")
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
        @employee.destroy
        redirect_to employees_path
    end
    
    @us_states = [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]

    private

        def modify_employee
            @employee=Employee.find(params[:id])
        end
        
        def employee_params
      params.require(:employee).permit(:first_name, :middle_i, :last_name, :street_address, :city, :state, :zipcode, :gender, :id_number, :admin, :status,:hire_date, :workers_comp_class, :work_location, :birthday, :jobtype, :rate, :paid_by, :social_security_number, :federal_filing_status, :federal_filing_allowances, :state_filing_status, :state_filing_allowances)
    end
end
