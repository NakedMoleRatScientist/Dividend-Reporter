require 'spec_helper'

describe Quote do
  before(:each) do
    stock = Factory(:stock)
    @quote = Factory(:quote, :stock_id => stock.id)
  end

  it "should never have ex_date come after pay_date" do
    ex = Factory(:quote, :ex_date => DateTime.now + 21.days)
    ex.should_not be_valid
  end

end
