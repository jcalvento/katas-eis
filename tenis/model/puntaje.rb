require_relative 'punto'
require_relative 'game'
require_relative 'tennis_set'

class Puntaje

  attr_reader :jugador

  def self.para un_marcador, un_jugador
    self.new un_marcador, un_jugador
  end

  def initialize un_marcador, un_jugador
    @marcador = un_marcador
    @jugador = un_jugador
    @punto = Punto.para_comenzar
    @game = Game.para_comenzar
    @set = TennisSet.para_comenzar
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

  def sets
    @set.valor
  end

  def sumar_punto
    @punto = @punto.sumar_punto_en self
    @marcador.se_sumo_punto
  end

  def sumar_game
    @game = @game.sumar_game_en self
    @marcador.se_sumo_un_game_a self
  end

  def sumar_set
    @set = @set.sumar_set_en self
    @marcador.se_sumo_un_set_a self
  end

  def marcar_ventaja
    @marcador.se_sumo_punto
    @punto = Punto.para_ventaja
  end

  def tiene_cuarenta_puntos?
    @punto.es_cuarenta?
  end

  def pertenece_a? un_jugador
    @jugador.equal? un_jugador
  end

  def se_termino_el_set_final
    @marcador.se_gano_el_partido_con self
  end

end