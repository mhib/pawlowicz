class AddViewsToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :views, :integer, default: 0
  end
end
