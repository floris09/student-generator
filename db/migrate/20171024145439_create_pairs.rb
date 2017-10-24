class CreatePairs < ActiveRecord::Migration[5.1]
  def change
    create_table :pairs do |t|
      t.string :combinations, array: true, default: []

      t.timestamps
    end
  end
end
