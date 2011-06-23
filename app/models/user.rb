class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  authenticates_with_sorcery!

  validates_confirmation_of :password, :on => :create, :message => "should match confirmation"
  has_many :watchlists, :foreign_key => "user_id"
  has_many :watching, :through => :watchlists, :source => :watched
end
