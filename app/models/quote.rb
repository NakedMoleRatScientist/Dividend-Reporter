class Quote < ActiveRecord::Base
  validate :ex_date_cannot_be_more_in_the_future_than_pay_date
  validates :price, :presence => true, :numericality => true
  validates :dividend_share, :presence => true, :numericality => true
  def ex_date_cannot_be_more_in_the_future_than_pay_date 
    errors.add(:ex_date, "can't be further into the future than pay_date") if self.ex_date > self.pay_date
  end

end
