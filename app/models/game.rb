class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :group
  belongs_to :screen
end
