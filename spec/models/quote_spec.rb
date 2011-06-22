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

  it "should never have an empty dividend_share" do
    noshare = Quote.new(@attr.merge(:dividend_share => ""))
    noshare.should_not be_valid
  end

  it "should not have characters in dividend_share" do
    nostring = Quote.new(@attr.merge(:dividend_share => "adffw"))
    nostring.should_not be_valid
  end

  it "should never have an empty yield" do
    noyield = Quote.new(@attr.merge(:yield => ""))
    noyield.should_not be_valid
  end

  it "should not have characters in yield" do
    nostring = Quote.new(@attr.merge(:yield => "kiro"))
    nostring.should_not be_valid
  end

  it "should fail when ex_date is empty" do
    nodate = Quote.new(@attr.merge(:ex_date => ""))
    nodate.should_not be_valid
  end

  it "should fail when ex_date is not a date" do
    notdate = Quote.new(@attr.merge(:ex_date => "adsf"))
    notdate.should_not be_valid
  end

  it "should fail when pay_date is empty" do
    nopay = Quote.new(@attr.merge(:pay_date => ""))
    nopay.should_not be_valid
  end
  
end
