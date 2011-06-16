require 'spec_helper'

describe Stock do
  before(:each) do
    @attr = {
      :symbol => "KR",
      :price => BigDecimal.new('24.00'),
      :dividend_share => BigDecimal.new('0.46'),
      :yield => BigDecimal.new("1.75"),
      :ex_date => Date.now,
      :pay_date => Date.now + 20.days
    }
  end
  it "should validates with proper values" do
    Stock.create!(@attr)
  end
end
