class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.references :type, index: true

      t.timestamps null: false
    end
    add_foreign_key :images, :types
  end
end
