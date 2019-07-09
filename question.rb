class Question
  attr_accessor :answer, :question
  def initialize
    @number_1 = rand(1..20)
    @number_2 = rand(1..20)
    @answer = @number_1 + @number_2
    @question = "What does #{@number_1} plus #{@number_2} equals?"
  end
end