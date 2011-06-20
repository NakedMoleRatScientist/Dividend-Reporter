class AddYieldToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :yield, :decimal
  end
end
