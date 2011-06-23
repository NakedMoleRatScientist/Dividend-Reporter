class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  authenticates_with_sorcery!

  validates_confirmation_of :password, :on => :create, :message => "should match confirmation"
  has_many :watchlists, :foreign_key => "watching_id"
  has_many :watching, :through => :watchlists, :source => :watched

  def watch! watched 
    watchlists.create!(:watched_id => watched.id)
  end

  def watching? watched 
    watchlists.find_by_watched_id(watched)
  end
end
