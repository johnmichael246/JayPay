class Payperiod < ApplicationRecord
  belongs_to :employee
  belongs_to :payroll
end
