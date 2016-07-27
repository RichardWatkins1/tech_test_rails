class Comment < ApplicationRecord

  validates :post_id, :content, presence: true
  belongs_to :post
end
