class Post < ApplicationRecord

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length:{ maximum:20 }
  validates :content, presence: true

#いいねがあるならfalseを返す
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(word)
    #空白ならば全部載せるそれ以外は、部分検索
    unless word == ""
      @post = Post.where(["title LIKE? OR content LIKE?","%#{word}%","%#{word}%"])
    else
      @post = Post.all
    end
  end
end
