class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :company_name
      t.timestamps
    end
  end
end
