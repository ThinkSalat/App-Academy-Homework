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
    game_over_message if @game_over
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message unless @game_over
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
    display = @seq.dup
    display.each do |color|
      system("clear")
      puts '-'
      system('clear')
      puts color
      sleep(2) if @sequence_length  < 5
      sleep(1) if @sequence_length >= 5
    end
  end

  def require_sequence
    system('clear')
    puts "Please enter sequence separated by commas"
    player_seq = gets.chomp.split(',')
    @game_over = true unless player_seq == @seq
  end


  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Congrats! Good luck on the next round"
  end

  def game_over_message
    "Too bad! Good luck next time!"
  end

  def reset_game
    initialize
  end
end
