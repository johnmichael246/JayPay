class Payperiod < ApplicationRecord
  belongs_to :employee
  belongs_to :payroll
  has_one :check, dependent: :destroy
end
