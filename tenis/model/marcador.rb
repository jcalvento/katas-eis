require_relative 'puntaje'
require_relative 'estado_de_marcador'

class Marcador
  def initialize
    @puntajesDeJugadores = {}
  end

  def empezar_partido_de(un_jugador, otro_jugador)
    @puntaje1 = Puntaje.para self, un_jugador
    @puntaje2 = Puntaje.para self, otro_jugador

    asignar_estado
  end

  def se_sumo_un_game_a un_puntaje
    puntaje_distinto_a(un_puntaje).reiniciar_puntos
  end

  def se_sumo_un_set_a un_puntaje
    puntaje_distinto_a(un_puntaje).reiniciar_games
  end

  def puntos_de(un_jugador)
    puntaje_de(un_jugador).puntos
  end

  def games_de(un_jugador)
    puntaje_de(un_jugador).games
  end

  def sets_de(un_jugador)
    puntaje_de(un_jugador).sets
  end

  def marcar_punto_para(un_jugador)
    puntaje_de(un_jugador).sumar_punto
  end

  def se_sumo_punto
    asignar_estado
  end

  def asignar_estado
    @estado = EstadoDeMarcador.para @puntaje1, @puntaje2
  end

  def se_gano_el_partido_con un_puntaje
    raise "El ganador del partido es #{un_puntaje.jugador}"
  end

  def sumar_punto_a_cuarenta_para un_puntaje
    @estado.sumar_punto_a un_puntaje
  end

  private

  def puntaje_de un_jugador
    [@puntaje1, @puntaje2].detect { |puntaje| puntaje.pertenece_a? un_jugador }
  end

  def puntaje_distinto_a otro_puntaje
    [@puntaje1, @puntaje2].reject { |puntaje| puntaje.equal? otro_puntaje }.first
  end
end