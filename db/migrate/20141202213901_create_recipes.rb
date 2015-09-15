class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :summary, :description
    
      t.references :chef, index: true, foreign_key: true

      t.timestamps
    end
  end
end
