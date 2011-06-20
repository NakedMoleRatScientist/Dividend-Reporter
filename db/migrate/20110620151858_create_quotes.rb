class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :stock_id
      t.decimal :dividend_share
      t.decimal :price
      t.date :ex_date
      t.date :pay_date

      t.timestamps
    end
  end
end
