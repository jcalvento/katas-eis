class Puntaje

  attr_reader :puntos

  def initialize
    @puntos = 0
  end

  def sumarPunto
    if puntos == 0
      @puntos = 15
    elsif puntos == 15
      @puntos = 30
    else
      @puntos = 40
    end
  end
end