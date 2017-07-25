class Payroll < ApplicationRecord
    has_many :payperiods
    has_many :employees, through: :payperiods
    has_many :checks, through: :payperiods
end
