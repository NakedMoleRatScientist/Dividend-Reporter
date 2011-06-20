class Quote < ActiveRecord::Base
  validate :ex_date_cannot_be_more_in_the_future_than_pay_date
  before_save :symbol_upper
  def symbol_upper 
    self.symbol.upcase!
  end

  def ex_date_cannot_be_more_in_the_future_than_pay_date 
    errors.add(:ex_date, "can't be further into the future than pay_date") if self.ex_date > self.pay_date
  end

end