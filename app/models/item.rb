class Item < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
  validates :url, presence: true, unless: Proc.new { |a| a.text.present? }
  validates :text, presence: true, unless: Proc.new { |a| a.url.present? }

  acts_as_votable
end
