class CreateWatchlists < ActiveRecord::Migration
  def change
    create_table :watchlists do |t|
      t.integer :watched_id
      t.integer :watching_id

      t.timestamps
    end
  end
end
