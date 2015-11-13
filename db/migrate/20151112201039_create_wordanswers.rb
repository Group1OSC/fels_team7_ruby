class CreateWordanswers < ActiveRecord::Migration
  def change
    create_table :wordanswers do |t|
      t.string :content
      t.integer :word_id
      t.integer :correct

      t.timestamps null: false
    end
  end
end
