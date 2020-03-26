class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.references :player, index: true
      t.references :game, index: true
      t.references :indicator, index: true
      t.integer :value, default: 0

      t.timestamps
    end
  end
end
