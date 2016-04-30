class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :type
      t.integer :value
      t.string :color

      t.timestamps null: false
    end
  end
end
