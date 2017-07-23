class AddEmployeeRefToPayroll < ActiveRecord::Migration[5.1]
  def change
    add_reference :payrolls, :employee, foreign_key: true
  end
end
