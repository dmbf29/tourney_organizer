class Group < ApplicationRecord
  belongs_to :tournament
  has_many :games
  has_many :entries

  enum name: [:A, :B, :C]
end
