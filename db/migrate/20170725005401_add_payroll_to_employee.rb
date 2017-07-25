class AddPayrollToEmployee < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :payroll, foreign_key: true
  end
end
