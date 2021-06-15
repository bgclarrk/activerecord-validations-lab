class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, uniqueness: true, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :post_is_clickbait?

    def post_is_clickbait?
        if title && title.match?(/(Won't Believe)|(Secret)|(Top [0-9])|(Guess)/)

        else
            errors.add(:title, "Must be clickbait")
        end
    end

end