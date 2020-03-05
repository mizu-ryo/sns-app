class Post < ApplicationRecord
  belongs_to :user
  default_scope -> {order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  # ポストをいいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

  # ポストのいいね(Like)を解除する
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

  # 現在のユーザーがいいね(Like)してたらtrueを返す
  def iine?(user)
    like_users.include?(user)
  end


end
