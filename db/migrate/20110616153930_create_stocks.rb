class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :company_name
      t.decimal :price
      t.decimal :dividend_share
      t.decimal :yield
      t.date :ex_date
      t.date :pay_date

      t.timestamps
    end
  end
end
