class Punto

  def self.para_comenzar
    CeroPuntos.new
  end

  def self.para_ventaja
    Ventaja.new
  end

  def valor
    raise 'Deberia implementarse en las subclases concretas'
  end

  def sumar_punto_en un_puntaje
    raise 'Deberia implementarse en las subclases concretas'
  end


  def es_cuarenta?
    raise 'Deberia implementarse en las subclases concretas'
  end

end

class CeroPuntos < Punto

  def valor
    0
  end

  def sumar_punto_en un_puntaje
    QuincePuntos.new
  end

  def es_cuarenta?
    false
  end

end

class QuincePuntos < Punto

  def valor
    15
  end

  def sumar_punto_en un_puntaje
    TreintaPuntos.new
  end

  def es_cuarenta?
    false
  end

end

class TreintaPuntos < Punto

  def valor
    30
  end

  def sumar_punto_en un_puntaje
    CuarentaPuntos.new
  end

  def es_cuarenta?
    false
  end

end

class CuarentaPuntos < Punto

  def valor
    40
  end

  def sumar_punto_en un_puntaje
    un_puntaje.sumar_game
    CeroPuntos.new
  end

  def es_cuarenta?
    true
  end

end

class Ventaja < Punto

  def valor
    'Ventaja'
  end

  def sumar_punto_en un_puntaje
    un_puntaje.sumar_game
    CeroPuntos.new
  end

  def es_cuarenta?
    false
  end

end