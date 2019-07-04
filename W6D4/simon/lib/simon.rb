class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    puts game_over_message
    reset_game
  end

  def take_turn
    unless game_over
      # self.show_sequence
      # self.require_sequence

      if show_sequence == require_sequence
        round_success_message
        @sequence_length += 1
      else  
        game_over = true
      end
    end
  end

  def show_sequence
    sequence_length.times do
      add_random_color
    end

    until seq.empty?
      puts seq.pop
      sleep(1)
    end

  end

  def require_sequence
    puts "Please do as simon says: "
    input = gets.chomp
    
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    "Great job! you got it right! Ready for one more?..."
  end

  def game_over_message
    "sorry, but that was not the right sequence. you lose"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

# new_game = Simon.new
# new_game.play
