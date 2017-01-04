class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :file_name
      t.string :title
      t.string :description
      t.string :alt
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
