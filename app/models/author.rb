class Author < ActiveRecord::Base
    validates :name, presence: true, uniqueness: true
    validates :phone_number, length: { only_integer: true, is: 10 }

end