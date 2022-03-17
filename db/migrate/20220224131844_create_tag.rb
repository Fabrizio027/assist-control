class CreateTag < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :user
      t.string :name
      t.boolean :active
      t.timestamps
    end
  end
end
