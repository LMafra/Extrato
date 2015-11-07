class CreatePerfomanceAnswers < ActiveRecord::Migration
  def change
    create_table :perfomance_answers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :userLogged, index: true, foreign_key: true
      t.references :perfomance, index: true, foreign_key: true
      t.references :dimension, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.integer :value
      t.string :text

      t.timestamps null: false
    end
  end
end
