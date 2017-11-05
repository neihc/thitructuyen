class CreateExamCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_categories do |t|
      t.references :exam, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
