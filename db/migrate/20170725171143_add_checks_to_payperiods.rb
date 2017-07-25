class AddChecksToPayperiods < ActiveRecord::Migration[5.1]
  def change
    add_reference :payperiods, :checks, foreign_key: true
  end
end
