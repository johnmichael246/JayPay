class Employee < ApplicationRecord
    has_many :payperiods
    has_many :payrolls, through: :payperiods
    has_many :checks, through: :payperiods

    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}, length: { minimum: 2 }
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}, length: { minimum: 2 }
    validates :street_address, :city, :work_location, :jobtype, presence: true
    validates :gender, presence: true 

    validates :social_security_number, presence: true, length: { is: 9 }, uniqueness: true;
    validates :federal_filing_status, :federal_filing_allowances, :state_filing_status, :state_filing_allowances, presence: true, numericality: {only_integer: true}
    validates :id_number, presence: true, uniqueness: true
end
