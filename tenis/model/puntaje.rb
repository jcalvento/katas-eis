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

  def reiniciar_games
    reiniciar_puntos
    @game = Game.para_comenzar
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
      @marcador.se_sumo_un_set_a self
    end
  end

  def sumar_punto_para_cuarenta
    @marcador.sumar_punto_a_cuarenta_para self
  end

  def marcar_ventaja
    @punto = Ventaja.new
  end

  def marcar_punto_para_game
    @punto = @punto.sumar_punto
    sumar_game
  end

  def tiene_cuarenta_puntos?
    @punto.es_cuarenta?
  end
end