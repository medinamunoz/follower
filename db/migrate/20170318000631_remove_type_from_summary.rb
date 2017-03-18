class RemoveTypeFromSummary < ActiveRecord::Migration[5.0]
  def change 
  	remove_column :summaries, :type
  end
end
