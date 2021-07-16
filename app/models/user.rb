# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :followers, class_name: 'Relationship',
                       foreign_key: 'follower_id',
                       dependent: :destroy,
                       inverse_of: :follower
  has_many :followings, class_name: 'Relationship',
                        foreign_key: 'followed_id',
                        dependent: :destroy,
                        inverse_of: :followed
  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followings, source: :follower

  def follow(user_id)
    followers.create(followed_id: user_id)
  end

  def following?(user)
    following_users.include?(user)
  end
end
