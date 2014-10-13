class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body, :null => false
      t.timestamps, :null => false
    end
  end
end
