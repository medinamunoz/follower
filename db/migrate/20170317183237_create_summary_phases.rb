class CreateSummaryPhases < ActiveRecord::Migration[5.0]
  def change
    create_table :summary_phases do |t|
      t.references :summary, foreign_key: true
      t.references :phase, foreign_key: true

      t.timestamps
    end
  end
end
