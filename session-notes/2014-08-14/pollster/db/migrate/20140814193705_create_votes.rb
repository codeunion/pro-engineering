class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id,  null: false
      t.integer :poll_id,  null: false
      t.integer :response, null: false

      t.timestamps
    end

    add_index :votes, [:user_id, :poll_id], unique: true
    add_index :votes, :poll_id
  end
end
