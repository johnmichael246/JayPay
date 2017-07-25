class AddEmployeeIdToChecks < ActiveRecord::Migration[5.1]
  def change
    add_reference :checks, :employee, foreign_key: true
  end
end
