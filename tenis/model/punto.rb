class Punto
  def self.para_comenzar
    CeroPuntos.new
  end

  def valor
    raise 'Deberia implementarse en las subclases concretas'
  end

  def sumar_punto_en un_puntaje
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
end

class QuincePuntos < Punto
  def valor
    15
  end


  def sumar_punto_en un_puntaje
    TreintaPuntos.new
  end
end

class TreintaPuntos < Punto
  def valor
    30
  end


  def sumar_punto_en un_puntaje
    CuarentaPuntos.new
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
end