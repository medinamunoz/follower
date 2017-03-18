class AddTypeToSummaryUser < ActiveRecord::Migration[5.0]
  def change
    add_column :summary_users, :type, :integer
  end
end
