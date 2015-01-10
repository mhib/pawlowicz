class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :body
      t.string :author
      t.integer :vote, default: 0

      t.timestamps null: false
    end
  end
end
