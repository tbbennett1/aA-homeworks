require "byebug"

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
    puts "Wanna play again? y/n"
    input = gets.chomp
    if input == "y"
      reset_game
      play
    else
      puts "Thanks for playing"
    end
  end

  def take_turn
    unless game_over
      show_sequence
      require_sequence

      if show_sequence == require_sequence
        round_success_message
        @sequence_length += 1
      else  
        game_over = true
      end
    end
  end

  def show_sequence
    @sequence_length.times do
      add_random_color
    end
    duped_seq = seq.dup

    until seq.empty?
      print seq.pop 
      sleep(0.5)
      print "\r"
      $stdout.flush
    end

    duped_seq
  end

  def require_sequence
    player_input = []
    puts "Please do as simon says:"
    @sequence_length.times do 
      input = gets.chomp
      player_input << input
    end

    player_input
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Great job! you got it right! Ready for one more?..."
  end

  def game_over_message
    puts "sorry, but that was not the right sequence. you lose"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

new_game = Simon.new
new_game.play
