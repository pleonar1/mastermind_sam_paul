class Sequence

  attr_reader :colors

  def initialize(difficulty = "Beginner")
    @colors = ['R','B','G','Y']
  end

  def generate
    code = []
      4.times do
        color = @colors.shuffle
        code << color[0]
      end
    code
  end
end
