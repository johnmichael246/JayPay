class AddCurrentToPayroll < ActiveRecord::Migration[5.1]
  def change
    add_column :payrolls, :current, :boolean, :default=> true
  end
end
