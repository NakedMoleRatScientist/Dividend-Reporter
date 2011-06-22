require 'spec_helper'

describe Stock do
  before(:each) do
    @attr = {
      :symbol => "KR",
      :company_name => "Kroger Company"
    }
  end
  it "should validates with proper values" do
    Stock.create!(@attr)
  end

  it "should not validates with empty stock symbol" do
    empty = Stock.new(@attr.merge(:symbol => ""))
    empty.should_not be_valid
  end

  it "should not validates when symbol is six characters or longer" do
    toolong = Stock.new(@attr.merge(:symbol => "ASDFASDF"))
    toolong.should_not be_valid
  end

  it "should not validates with empty stock company name" do
    empty = Stock.new(@attr.merge(:company_name => ""))
    empty.should_not be_valid
  end

  describe "quote associations" do
    before(:each) do
      @stock = Factory(:stock)
      @q1 = Factory(:quote, :stock_id => @stock.id, :price => 12)
      @q2 = Factory(:quote, :stock_id => @stock.id, :price => 9)
    end

    it "should have a quotes attribute" do
      @stock.should respond_to(:quotes)
    end

    it "should have the right quotes in the proper order" do
      @stock.quotes.should == [@q2,@q1]
    end
  end


end
