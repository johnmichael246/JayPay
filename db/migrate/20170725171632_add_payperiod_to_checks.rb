class AddPayperiodToChecks < ActiveRecord::Migration[5.1]
  def change
    add_reference :checks, :payperiod, foreign_key: true
  end
end
