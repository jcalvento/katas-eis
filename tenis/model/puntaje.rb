require_relative 'punto'

class Puntaje

  attr_reader :games

  def self.en un_marcador
    self.new un_marcador
  end

  def initialize un_marcador
    @marcador = un_marcador
    @puntos = Punto.para_comenzar
    @games = 0
  end

  def reiniciar_puntos
    @puntos = Punto.para_comenzar
  end

  def puntos
    @puntos.valor
  end

  def sumar_punto
    @puntos = @puntos.sumar_punto_en self
  end

  def sumar_game
    @games += 1
    @marcador.se_sumo_un_game_a self
  end
end