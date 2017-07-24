class CreatePayrolls < ActiveRecord::Migration[5.1]
  def change
    create_table :payrolls do |t|
      t.date :end_date

      t.timestamps
    end
  end
end
