class AddPhaseToSummaryPhase < ActiveRecord::Migration[5.0]
  def change
    add_column :summary_phases, :phase, :integer
  end
end
