class Post < ActiveRecord::Base
  # Looking at
  # <http://guides.rubyonrails.org/active_record_validations.html#length>
  validates :body,
    :presence => true,
    :length   => { :minimum => 50, :maximum => 1000 }

  validates :title, :presence => true, :length => { :minimum => 5, :maximum => 100 }
end


class Person
    def full_name
        "#{first_name} #{last_name}"
    end
end
