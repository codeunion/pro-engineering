# users: id
# photos: id, user_id, win_count, loss_count
# duels_photos: id, photo_id, duel_id, position
# duels: id, user_id, winning_photo_id

# SELECT *
# FROM photos AS p
# JOIN duels_photos AS dp
#   ON (p.id = dp.photo_id)
# JOIN duels AS d
#   ON (d.id = dp.duel_id)


#       /--> duels_photos.photo_id --> photos.id
# duels
#       \--> duels_photos.photo_id --> photos.id

# (duel_id) not UNIQUE, but can only appear twice

# users: id
# photos: id, user_id, win_count, loss_count
# pairings: id, first_photo_id, second_photo_id
# duel: id, user_id, pairing_id, winning_photo_id

class User < ActiveRecord::Base
  has_many :photos
  has_many :duels

  def active_duel
    # If a non-complete duel exists, return the most recent one.
    # Otherwise, create a new non-complete duel and return that
    # Where complete = winner exists or skipped
  end
end

class Photo < ActiveRecord::Base
  has_many :duels_photos
  has_many :duels, :through => :duels_photos
end

class DuelsPhoto < ActiveRecord::Base
  belongs_to :photo
  belongs_to :duel
end

#         / ---> join table ---> duel
#        |  ---> join table ---> duel
# photo -|  ---> join table ---> duel
#        |  ---> join table ---> duel
#         \ ---> join table ---> duel

#         / ---> join table ---> photo
#        |  ---> join table ---> photo
# duel  -|  ---> join table ---> photo
#        |  ---> join table ---> photo
#         \ ---> join table ---> photo

# photo_id, duel_id
# (1,20)
# (1,21)
# (2,20)
# (2,22)
# (3,22)
# (4,21)

class Duel < ActiveRecord::Base
  has_many :duels_photos
  has_many :photos, :through => :duels_photos
  belongs_to :winning_photo, :class_name => 'Photo'

  validate :photos, :length => 2
  validate :winning_photo,
    inclusion: { in: -> { |duel| duel.photos } }


  # "->" is called the "stabby lambda"
  # http://stackoverflow.com/questions/9340117/what-is-the-stab-operator-in-ruby
  # http://guides.rubyonrails.org/active_record_querying.html#scopes
  scope :with_winner, -> { where.not(:winner_id => nil) }
  scope :skipped, -> { where.not(:skipped_at => nil) }

  def self.random_duel
    duel = self.new

    Photo.pluck(:id).sample(2)
    # SELECT id FROM photos
    # Photo.find(5)
    # SELECT * FROM photos WHERE id = 5
    # This will return two random (distinct) photo_ids
  end

  def declare_winner!(photo)
    self.winning_photo = photo
    self.save!
  end

  def skip!
    self.update_attributes(:skipped_at => Time.zone.now)
  end

  def complete?
    # Where complete = winner exists or skipped
    winning_photo.present? || skipped?
  end

  def skipped?
    skipped_at.present?
  end
end
