class Culture < ApplicationRecord
  belongs_to :user
  validates :text, presence: true, length: { maximum: 255 }
end
