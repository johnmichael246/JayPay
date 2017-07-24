class AddReghoursToPayperiods < ActiveRecord::Migration[5.1]
  def change
    add_column :payperiods, :reg_hours, :float
  end
end
