class CreateChefsTable < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :chefname
      t.string :email
      t.timestamps :created_at, :updated_at
      
    end
  end
end
