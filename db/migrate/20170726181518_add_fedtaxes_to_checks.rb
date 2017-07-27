class AddFedtaxesToChecks < ActiveRecord::Migration[5.1]
  def change
    add_column :checks, :fed_taxes, :float
  end
end
