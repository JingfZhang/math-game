require "./player"
require "./question"


class Game
  def initialize
    p1 = Player.new("player1")
    p2 = Player.new("player2")
    @players = [p1, p2]
  end

  def play
    round_count = 0
    while (!game_over?)
      round_count += 1
      turn = Turn.new(@players[0], round_count, Question.new)
      puts "============ Turn #{round_count} ============"
      puts
      puts "Question #{round_count}: #{turn.question.question}"
      puts
      print "#{turn.player.name}: "
      turn_answer = gets.chomp.to_i
      puts

      if !turn.correct?(turn_answer)
        puts ">>>>>>Wrong!!"
        turn.player.life -= 1
      else
        puts ">>>>>>Correct!!"
        turn.player.score += 1
      end

      puts
      puts "--------- SUMMARY ---------"
      puts turn_summary
      puts

      @players.rotate!
    end

    puts">>>>>>#{alive_player[0].name} IS SMARTER!!!<<<<<<"

  end

  def turn_summary
    sorted_players = @players.sort {|a, b| a.name <=> b.name}
    sorted_players.map {|player| player.summary}.join("\n")
  end

  def alive_player
    @players.select {|player| player.life > 0}
  end

  def game_over?
    alive_player.count == 1
  end
end