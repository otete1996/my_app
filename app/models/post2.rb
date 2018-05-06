class Post2 < ApplicationRecord
  belongs_to :user
  belongs_to :article2
  validates :content,presence: true
end
