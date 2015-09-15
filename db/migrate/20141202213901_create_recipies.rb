class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipies do |t|
      t.string :title
      t.text :text
      t.references :chef, index: true, foreign_key: true

      t.timestamps
    end
  end
end
