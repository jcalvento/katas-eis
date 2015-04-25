class Puntaje

  attr_reader :puntos

  def initialize
    @puntos = 0
  end

  def sumarPunto
    if @puntos == 0
      @puntos = 15
    end
  end
end