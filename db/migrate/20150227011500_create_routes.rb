class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :keywords

      t.timestamps null: false
    end
  end
end
