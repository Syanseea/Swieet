class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #中間テーブルを作成した
  has_many :relationships, class_name:"Relationship", foreign_key:"follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name:"Relationship", foreign_key:"followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed
  has_one_attached :profile_image, dependent: :destroy

  validates :name, presence: true
#ゲスト機能
  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  def get_profile_image(width, height)
#画像搭載機能
    unless profile_image.attached?
      file_path =Rails.root.join('app/assets/images/swieetnoimage.png')
      profile_image.attach(io:File.open(file_path), filename:'default-image.jpg', content_type:'image/jpeg')
    end
    profile_image.variant(resize_to_limit:[width, height]).processed
  end
#フォロー機能
  def follow(user)
    relationships.create(followed_id: user.id)
  end
#フォロー機能
  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end
#フォローしているかどうか判断
  def following?(user)
    followings.include?(user)
  end
#検索機能
  def self.looks(word)
    unless word == ""
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

end
