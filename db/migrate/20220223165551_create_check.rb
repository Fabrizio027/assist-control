class CreateCheck < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.references :user
      t.datetime :entry_time
      t.datetime :exit_time
      t.float :hours_total
      t.integer :type_control
      t.timestamps

    end
  end
end
