class Group < ApplicationRecord
  belongs_to :tournament
  has_many :games, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :players, through: :entries

  enum name: [:A, :B, :C]
end
