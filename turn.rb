class Turn
  attr_accessor :player, :question

  def initialize player, round_number, question
    @player = player
    @round_number = round_number
    @question = question
  end

  def correct? (ans)
    @question.answer == ans
  end
end
