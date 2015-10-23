class CreateRecipeStyles < ActiveRecord::Migration
  def change
    create_table :recipe_styles do |t|
      t.integer :recipe_id
      t.integer :style_id
      t.timestamps :created_at, :updated_at
    end
  end
end
