class CreateQuestions < ActiveRecord::Migration
  def change
  	drop_table :questions
    create_table :questions do |t|
      t.string :question
      t.references :dimension, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
