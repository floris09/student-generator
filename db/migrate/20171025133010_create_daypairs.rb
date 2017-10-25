class CreateDaypairs < ActiveRecord::Migration[5.1]
  def change
    create_table :daypairs do |t|
      t.date :date
      t.text :pairs, array: true, default: []

      t.timestamps
    end
  end
end
