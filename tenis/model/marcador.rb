require_relative 'puntaje'

class Marcador
  def initialize
    @puntajesDeJugadores = {}
  end

  def empezar_partido_de(un_jugador, otro_jugador)
    @puntajesDeJugadores[un_jugador] = Puntaje.en self
    @puntajesDeJugadores[otro_jugador] = Puntaje.en self
  end

  def se_sumo_un_game_a un_puntaje
    puntaje_distinto_a(un_puntaje).reiniciar_puntos
  end

  def se_sumo_un_set_a un_puntaje
    puntaje_distinto_a(un_puntaje).reiniciar_games
  end

  def puntos_de(un_jugador)
    @puntajesDeJugadores[un_jugador].puntos
  end

  def games_de(un_jugador)
    @puntajesDeJugadores[un_jugador].games
  end

  def sets_de(un_jugador)
    @puntajesDeJugadores[un_jugador].sets
  end

  def marcar_punto_para(un_jugador)
    @puntajesDeJugadores[un_jugador].sumar_punto
  end

  def se_gano_el_partido_con un_puntaje
    jugador = @puntajesDeJugadores.detect { |jugador, puntaje| puntaje == un_puntaje }.first
    raise "El ganador del partido es #{jugador}"
  end

  def sumar_punto_a_cuarenta_para un_puntaje
    puntaje = puntaje_igual_a un_puntaje
    otro_puntaje = puntaje_distinto_a un_puntaje

    if puntaje.tiene_cuarenta_puntos? && otro_puntaje.tiene_cuarenta_puntos?
      un_puntaje.marcar_ventaja
    else
      un_puntaje.marcar_punto_para_game
    end
  end
  private

  def puntaje_igual_a otro_puntaje
    @puntajesDeJugadores.detect { |jugador, puntaje| puntaje == otro_puntaje }[1]
  end

  def puntaje_distinto_a otro_puntaje
    @puntajesDeJugadores.detect { |jugador, puntaje| puntaje != otro_puntaje }[1]
  end
end