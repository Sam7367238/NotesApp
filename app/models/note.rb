class Note < ApplicationRecord
  has_many :related_notes
  belongs_to :user
end
