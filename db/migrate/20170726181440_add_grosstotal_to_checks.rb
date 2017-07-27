class AddGrosstotalToChecks < ActiveRecord::Migration[5.1]
  def change
    add_column :checks, :gross_total, :float
  end
end
