class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :items

  validates :handle, presence: true, uniqueness: true, length: { minimum: 6 }
  validates :first_name, presence: true
  validates :last_name, presence: true
end
