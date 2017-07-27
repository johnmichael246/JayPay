class AddStatetaxesToChecks < ActiveRecord::Migration[5.1]
  def change
    add_column :checks, :state_taxes, :float
  end
end
