class CreateMediaCollections < ActiveRecord::Migration
  def change
    create_table :media_collections do |t|
      t.integer :medium_id, null: false
      t.integer :collection_id, null: false
      t.boolean :cover, default: false

      t.index :medium_id
      t.index :collection_id
    end
  end
end
