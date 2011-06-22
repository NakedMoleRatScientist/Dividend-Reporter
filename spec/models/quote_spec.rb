require 'spec_helper'

describe Quote do
  before(:each) do
    stock = Factory(:stock)
    @attr = {
      :stock_id => stock.id,
      :price => BigDecimal.new('24.00'),
      :dividend_share => BigDecimal.new("0.46"),
      :yield => BigDecimal.new("1.75"),
      :ex_date => DateTime.now,
      :pay_date => DateTime.now + 20.days
    }
  end

  it "should validates with proper values" do
    quote = Quote.create(@attr)
    quote.should be_valid
  end

  it "should never have ex_date come after pay_date" do
    ex = Quote.new(@attr.merge(:ex_date => DateTime.now + 21.days))
    ex.should_not be_valid
  end

  it "should never have an empty price" do
    noprice = Quote.new(@attr.merge(:price => ""))
    noprice.should_not be_valid
  end

  it "should not have characters in price" do
    nostring = Quote.new(@attr.merge(:price => "as32"))
    nostring.should_not be_valid
  end
end
