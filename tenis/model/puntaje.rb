require_relative 'punto'
require_relative 'game'

class Puntaje

  attr_reader :sets

  def self.en un_marcador
    self.new un_marcador
  end

  def initialize un_marcador
    @marcador = un_marcador
    @punto = Punto.para_comenzar
    @game = Game.para_comenzar
    @sets = 0
  end

  def reiniciar_puntos
    @punto = Punto.para_comenzar
  end

  def puntos
    @punto.valor
  end

  def games
    @game.valor
  end

  def sumar_punto
    @punto = @punto.sumar_punto_en self
  end

  def sumar_game
    @game = @game.sumar_game_en self
    @marcador.se_sumo_un_game_a self
  end

  def sumar_set
    if @sets == 1
      @marcador.se_gano_el_partido_con self
    else
      @sets += 1
    end
  end

  def gano?
    sets.equal? 2
  end
end