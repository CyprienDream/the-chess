class Board < ApplicationRecord
  has_many :board_players
  has_many :users, through: :board_players
  has_many :moves
end
