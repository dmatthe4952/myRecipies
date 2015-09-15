class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :text
      t.references :chef, index: true, foreign_key: true

      t.timestamps
    end
  end
end
