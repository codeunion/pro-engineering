class User < ActiveRecord::Base
  has_secure_password

  has_many :polls
  has_many :votes
  has_many :voted_in_polls, :through => :votes, :source => :poll

  def voted_in?(poll)
    voted_in_polls.include?(poll)
  end

  def vote_for(poll)
    votes.where(poll: poll).first
  end
end
