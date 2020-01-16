class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true, presence: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }


    def featured_post
        self.posts.order(likes: :desc)[0]
      end
    
      def total_likes
        self.posts.inject(self.posts[0].likes) do |sum, post|
            sum + post.likes
        end
      end

end
