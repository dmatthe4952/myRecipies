class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.timestamps :created_at, :updated_at
    end
  end
end
