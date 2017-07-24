class AddOvrhoursToPayperiods < ActiveRecord::Migration[5.1]
  def change
    add_column :payperiods, :ovr_hours, :float
  end
end
