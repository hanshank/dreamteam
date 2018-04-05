class Game < ApplicationRecord
  belongs_to :user
  has_many :chess_pieces
  has_many :rooks
  has_many :knights
  has_many :bishops
  has_many :queens
  has_many :kings
  has_many :pawns
  validates :game_name, presence: true
  # after_save :populate_board, on: :create



  def populate_board
    Rook.create(game_id: id, x_position: 0, y_position: 0, color: false, icon: "br.svg")
    Rook.create(game_id: id, x_position: 7, y_position: 0, color: false, icon: "br.svg")
    Knight.create(game_id: id, x_position: 1, y_position: 0, color: false, icon: "bn.svg")
    Knight.create(game_id: id, x_position: 6, y_position: 0, color: false, icon: "bn.svg")
    Bishop.create(game_id: id, x_position: 2, y_position: 0, color: false, icon: "bb.svg")
    Bishop.create(game_id: id, x_position: 5, y_position: 0, color: false, icon: "bb.svg")
    Queen.create(game_id: id, x_position: 3, y_position: 0, color: false, icon: "bq.svg")
    King.create(game_id: id, x_position: 4, y_position: 0, color: false, icon: "bk.svg")
    Pawn.create(game_id: id, x_position: 0, y_position: 1, color: false, icon: "bp.svg")
    Pawn.create(game_id: id, x_position: 1, y_position: 1, color: false, icon: "bp.svg")
    Pawn.create(game_id: id, x_position: 2, y_position: 1, color: false, icon: "bp.svg")
    Pawn.create(game_id: id, x_position: 3, y_position: 1, color: false, icon: "bp.svg")
    Pawn.create(game_id: id, x_position: 4, y_position: 1, color: false, icon: "bp.svg")
    Pawn.create(game_id: id, x_position: 5, y_position: 1, color: false, icon: "bp.svg")
    Pawn.create(game_id: id, x_position: 6, y_position: 1, color: false, icon: "bp.svg")
    Pawn.create(game_id: id, x_position: 7, y_position: 1, color: false, icon: "bp.svg")
    Rook.create(game_id: id, x_position: 0, y_position: 7, color: true, icon: "wr.svg")
    Rook.create(game_id: id, x_position: 7, y_position: 7, color: true, icon: "wr.svg")
    Knight.create(game_id: id, x_position: 1, y_position: 7, color: true, icon: "wn.svg")
    Knight.create(game_id: id, x_position: 6, y_position: 7, color: true, icon: "wn.svg")
    Bishop.create(game_id: id, x_position: 2, y_position: 7, color: true, icon: "wb.svg")
    Bishop.create(game_id: id, x_position: 5, y_position: 7, color: true, icon: "wb.svg")
    Queen.create(game_id: id, x_position: 3, y_position: 7, color: true, icon: "wq.svg")
    King.create(game_id: id, x_position: 4, y_position: 7, color: true, icon: "wk.svg")
    Pawn.create(game_id: id, x_position: 0, y_position: 6, color: true, icon: "wp.svg")
    Pawn.create(game_id: id, x_position: 1, y_position: 6, color: true, icon: "wp.svg")
    Pawn.create(game_id: id, x_position: 2, y_position: 6, color: true, icon: "wp.svg")
    Pawn.create(game_id: id, x_position: 3, y_position: 6, color: true, icon: "wp.svg")
    Pawn.create(game_id: id, x_position: 4, y_position: 6, color: true, icon: "wp.svg")
    Pawn.create(game_id: id, x_position: 5, y_position: 6, color: true, icon: "wp.svg")
    Pawn.create(game_id: id, x_position: 6, y_position: 6, color: true, icon: "wp.svg")
    Pawn.create(game_id: id, x_position: 7, y_position: 6, color: true, icon: "wp.svg")

    # sets default state for board
    # self.update_attributes(locations: [[@black_rook_1, @black_knight_1, @black_bishop_1, @black_queen, @black_king, @black_bishop_2, @black_knight_2, @black_rook_2],
    # [@black_pawn_1, @black_pawn_2, @black_pawn_3, @black_pawn_4, @black_pawn_5, @black_pawn_6, @black_pawn_7, @black_pawn_8],
    # [nil, nil, nil, nil, nil, nil, nil, nil],
    # [nil, nil, nil, nil, nil, nil, nil, nil],
    # [nil, nil, nil, nil, nil, nil, nil, nil],
    # [nil, nil, nil, nil, nil, nil, nil, nil],
    # [@white_pawn_1, @white_pawn_2, @white_pawn_3, @white_pawn_4, @white_pawn_5, @white_pawn_6, @white_pawn_7, @white_pawn_8],
    # [@white_rook_1, @white_knight_1, @white_bishop_1, @white_queen, @white_king, @white_bishop_2, @white_knight_2, @white_rook_2]])
  end

  def pieces_remaining(color)
    pieces.includes(:game).where(
      "color = ? and state != 'off-board'",
      color).to_a
  end

end
