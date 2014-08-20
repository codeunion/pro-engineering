class Vote < ActiveRecord::Base
  validates :poll_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  belongs_to :poll
  belongs_to :user

  scope :yes_votes, lambda { where(response: 1) }
  scope :no_votes,  lambda { where(response: 0) }

  def yes_votes
    where(response: 1)
  end
end
