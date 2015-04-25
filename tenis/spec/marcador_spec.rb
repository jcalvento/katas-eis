require 'rspec'
require_relative '../model/marcador'

describe 'Marcador' do

  describe 'cuando empieza el partido' do
    let(:marcador) { Marcador.new }
    let(:jugador1) { 'jugador1' }
    let(:jugador2) { 'jugador2' }

    before :each do
      marcador.empezarPartidoDe jugador1, jugador2
    end

    it 'ambos jugadores deberian tener 0 puntos' do
      expect(marcador.puntosDe(jugador1)).to eq 0
      expect(marcador.puntosDe(jugador2)).to eq 0
    end

    it 'ambos jugadores deberian tener 0 games ganados' do
      expect(marcador.gamesDe(jugador1)).to eq 0
      expect(marcador.gamesDe(jugador2)).to eq 0
    end

    it 'ambos jugadores deberian tener 0 sets ganados' do
      expect(marcador.setsDe(jugador1)).to eq 0
      expect(marcador.setsDe(jugador2)).to eq 0
    end
  end
end