class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections, force: :cascade do |t|
      t.string :title1
      t.string :title2
      t.text :description
      t.integer :position, default: -1
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
