class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :user, null: false, index: true
      t.string :title, null: false
      t.string :url, null: false

      t.timestamps null: false
    end
  end
end
