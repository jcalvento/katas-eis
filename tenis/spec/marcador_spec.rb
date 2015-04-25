require 'rspec'
require_relative '../model/marcador'

describe 'Marcador' do

  let(:marcador) { Marcador.new }
  let(:jugador1) { 'jugador1' }
  let(:jugador2) { 'jugador2' }

  before :each do
    marcador.empezar_partido_de jugador1, jugador2
  end

  describe 'cuando empieza el partido' do
    it 'ambos jugadores deberian tener 0 puntos' do
      expect(marcador.puntos_de(jugador1)).to eq 0
      expect(marcador.puntos_de(jugador2)).to eq 0
    end

    it 'ambos jugadores deberian tener 0 games ganados' do
      expect(marcador.games_de(jugador1)).to eq 0
      expect(marcador.games_de(jugador2)).to eq 0
    end

    it 'ambos jugadores deberian tener 0 sets ganados' do
      expect(marcador.sets_de(jugador1)).to eq 0
      expect(marcador.sets_de(jugador2)).to eq 0
    end
  end

  describe 'cuando un jugador marca un punto' do
    it 'se le suma un punto a ese jugador aumentando el marcador' do
      marcador.marcar_punto_para jugador1

      expect(marcador.puntos_de(jugador1)).to eq 15
      expect(marcador.puntos_de(jugador2)).to eq 0
    end

    it 'teniendo 15, su proximo puntaje es 30' do
      2.times do
        marcador.marcar_punto_para jugador1
      end

      expect(marcador.puntos_de(jugador1)).to eq 30
      expect(marcador.puntos_de(jugador2)).to eq 0
    end

    it 'teniendo 30, su proximo puntaje es 40' do
      3.times do
        marcador.marcar_punto_para jugador1
      end

      expect(marcador.puntos_de(jugador1)).to eq 40
      expect(marcador.puntos_de(jugador2)).to eq 0
    end

    it 'teniendo 40, se le suma un game y el puntaje de ambos jugadores vuelve a 0' do
      marcador.marcar_punto_para jugador2 #para probar que vuelve a 0
      4.times do
        marcador.marcar_punto_para jugador1
      end

      expect(marcador.puntos_de(jugador1)).to eq 0
      expect(marcador.puntos_de(jugador2)).to eq 0
      expect(marcador.games_de(jugador1)).to eq 1
      expect(marcador.games_de(jugador2)).to eq 0
    end
  end
end