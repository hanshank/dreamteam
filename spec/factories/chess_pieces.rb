FactoryBot.define do
  factory :chess_piece do
    association :game
  end

    
  factory :king do
    association :game
    x_position 4
    y_position 4


  factory :rook do  
  end

  factory :bishop do  
  end

  factory :knight do  
  end

  factory :queen do  
  end

  factory :pawn do  

  end
end
