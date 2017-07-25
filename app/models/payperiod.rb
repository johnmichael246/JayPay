class Payperiod < ApplicationRecord
  belongs_to :employee
  belongs_to :payroll
  has_many :checks
end
