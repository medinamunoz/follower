class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :link
      t.references :summary_phase, foreign_key: true

      t.timestamps
    end
  end
end
