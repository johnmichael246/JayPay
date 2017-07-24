class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_i
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :gender
      t.string :id_number
      t.string :admin
      t.boolean :status
      t.date :hire_date
      t.integer :workers_comp_class
      t.string :work_location
      t.date :birthday
      t.string :jobtype
      t.float :rate
      t.string :paid_by
      t.string :social_security_number
      t.integer :federal_filing_status
      t.integer:federal_filing_allowances
      t.integer :state_filing_status
      t.integer :state_filing_allowances

      t.timestamps
    end
  end
end
