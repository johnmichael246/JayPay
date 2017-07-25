class Check < ApplicationRecord
  belongs_to :payperiod
  has_one :employee, through: :payperiod
end
