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
    puntaje = @puntajesDeJugadores.detect { |jugador, puntaje| puntaje != un_puntaje}[1]
    puntaje.reiniciar_puntos
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
end