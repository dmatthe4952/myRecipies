class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.references :chef, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true
      t.timestamps
    end
  end
end
