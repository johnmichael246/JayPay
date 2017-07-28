class Employee < ApplicationRecord
    has_many :payperiods
    has_many :payrolls, through: :payperiods
    has_many :checks, through: :payperiods

    validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}, length: { minimum: 2 }
    validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}, length: { minimum: 2 }
    validates :gender, presence: true
    validates :street_address, :city, :work_location, :jobtype, presence: true 
    validates :zipcode, presence: true, length: { is: 5 }
    validates :social_security_number, presence: true, length: { is: 9 }, uniqueness: true
    validates :federal_filing_allowances, :state_filing_allowances, presence: true, numericality: {only_integer: true}
    validates :id_number, presence: true, uniqueness: true
    validates :federal_filing_status, :state_filing_status, presence: true
    

    def self.search(search)
        # "name like ?", "%#{search}%"
        # where("name LIKE ?", "%#{search}")
        # where("jobtype LIKE ?", "%#{search}")
        # where("status LIKE ?", "%#{search}")
        # where(" LIKE ?", "%#{search}")
        # where("status LIKE ?", "%#{search}")
    end
    

end
