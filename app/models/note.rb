class Note < ApplicationRecord
  has_many :related_notes, dependent: :destroy
  belongs_to :user
end
