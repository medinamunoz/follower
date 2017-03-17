class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.string :description
      t.text :note
      t.integer :resolution
      t.integer :type
      t.timestamp :starting_day
      t.timestamp :close_day

      t.timestamps
    end
  end
end
