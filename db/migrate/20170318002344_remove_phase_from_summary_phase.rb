class RemovePhaseFromSummaryPhase < ActiveRecord::Migration[5.0]
  def change
    remove_reference :summary_phases, :phase, foreign_key: true
  end
end
