class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1, @player2 = name1, name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_index do |i|
      @cups[i] = [:stone] * 4 if (0..5).include?(i) || (7..12).include?(i)
    end
  end

  def valid_move?(start_pos)
    raise StandardError.new("Invalid starting cup") if !start_pos.between?(0, 12)
    raise StandardError.new("Invalid starting cup") if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
      stones = @cups[start_pos].count
      empty_cup(start_pos)

      i = start_pos
      until stones == 0
        i += 1
        i %= 14
        next if i == 6 && current_player_name == @player2
        next if i == 13 && current_player_name == @player1
        @cups[i] << :stone
        stones -= 1
      end

      render
      next_turn(i)
  end


  def empty_cup(cup)
    @cups[cup] = []
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif
       @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..6).all? {|cup| @cups[cup].empty?} || (0..12).all? {|cup| @cups[cup].empty?}
  end

  def winner
    p1 = @cups[6]
    p2 = @cups[13]
    case p1 <=> p2
    when -1 then @player2
    when 0 then :draw
    when 1 then @player1
    end
  end
end
