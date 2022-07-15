class Post < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.looks(word)
    unless word = ""
      @post = Post.where(["title LIKE? OR content LIKE?","%#{word}%","%#{word}%"])
    else
      @post = Post.all
    end 
  end 
end
