class CreateChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :checks do |t|
      t.integer :check_id
      t.float :check_total
      t.string :check_name
      t.references :payroll, foreign_key: true

      t.timestamps
    end
  end
end
