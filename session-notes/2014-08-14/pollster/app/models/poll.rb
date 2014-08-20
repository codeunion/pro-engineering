class Poll < ActiveRecord::Base
  has_many :votes
  belongs_to :user

  def yes_votes_count
    votes.yes_votes.count
  end

  def no_votes_count
    votes.no_votes.count
  end
end
