class Payroll < ApplicationRecord
    has_many :payperiods
    has_many :employees, through: :payperiods
end
