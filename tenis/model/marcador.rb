require_relative 'puntaje'

class Marcador
  def initialize
    @puntajesDeJugadores = {}
  end
  def empezarPartidoDe(un_jugador, otro_jugador)
    @puntajesDeJugadores[un_jugador] = Puntaje.new
    @puntajesDeJugadores[otro_jugador] = Puntaje.new
  end

  def puntosDe(un_jugador)
    @puntajesDeJugadores[un_jugador].puntos
  end

  def gamesDe(un_jugador)
    0
  end

  def setsDe(un_jugador)
    0
  end

  def marcarPuntoPara(un_jugador)
    @puntajesDeJugadores[un_jugador].sumarPunto
  end
end