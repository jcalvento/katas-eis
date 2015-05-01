class Board
  attr_reader :width, :height

  def self.with_dimensions width, height
    self.new width, height
  end

  def initialize width, height
    @width = width
    @height = height
  end
end