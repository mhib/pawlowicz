class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :quote, index: true
      t.boolean :positive, default: true
      t.string :ip

      t.timestamps null: false
    end
    add_foreign_key :votes, :quotes
  end
end
