class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.timestamps :created_at, :updated_at
    end
  end
end
