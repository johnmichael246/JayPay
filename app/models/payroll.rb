class Payroll < ApplicationRecord
    has_many :payperiods, dependent: :destroy
    has_many :employees, through: :payperiods
    has_many :checks, through: :payperiods

    def pay_date
        self.end_date + 5.days
    end
end
