class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :user_id ,presence: true
  validates :content, presence: true , length: { maximum: 140 }
  default_scope -> { order(created_at: :desc)}
  acts_as_votable
  
  def self.search(search)
        if search
            where(["content LIKE ?","%#{search}%"])
        else
            all
        end 
  end
end
