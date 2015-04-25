require 'rspec'
require_relative '../model/marcador'

describe 'Marcador' do

  describe 'cuando empieza el partido' do
    it 'deberia tener 0 puntos para ambos jugadores' do
      marcador = Marcador.new
      jugador1 = 'jugador1'
      jugador2 = 'jugador2'

      marcador.empezarPartidoDe jugador1, jugador2

      expect(marcador.puntosDe(jugador1)).to eq 0
      expect(marcador.puntosDe(jugador2)).to eq 0
    end
  end
end